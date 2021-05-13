import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/model/novaPartida/presenca/PresencaEvent.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:ludo_academy/view/blocs/novaPartida/presenca/PresencaBloc.dart';

class AlunosNovaPartidaList extends StatefulWidget {
  final List<AlunoPresenca> oAlunos;
  final PresencaBloc oBlocPresenca;

  AlunosNovaPartidaList({Key key, @required this.oAlunos, @required this.oBlocPresenca }) : super(key: key);

  @override
  State createState() => new AlunosNovaPartidaListStateComponent();
}

class AlunosNovaPartidaListStateComponent extends State<AlunosNovaPartidaList> {

  String barcode = "";

  @override
  void initState() {
    super.initState();

    /*
    NovaPartidaBloc oBlocNovaPartida = BlocProvider.of<NovaPartidaBloc>(context);

    //oBlocNovaPartida.oNovaPartida.clearAlunos();

    widget.oAlunos.forEach((aluno) {
      if (aluno.presenca > 0) {
        oBlocNovaPartida.oNovaPartida.addAluno(aluno);
      }
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    //print ("length presenca alunos: " + oBlocNovaPartida.oNovaPartida.lAlunos.length.toString());

    return SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        //margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery
                  .of(context)
                  .size
                  .height / 1.35
          ),
          child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: widget.oAlunos.length,
              itemBuilder: (context, index) {
                //return Text(items[index].nome.toUpperCase());

                return InkWell(
                  onTap: () {
                    print("presenca: " +
                        widget.oAlunos[index].presenca.toString());
                    if (widget.oAlunos[index].presenca > 0) {
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Aluno já está presente'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    else {
                      scan(widget.oAlunos[index]);
                    }
                  },
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: widget.oAlunos[index].fundo
                              //color: new Color(0xFFFFFFFF)
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: widget.oAlunos[index].fundo
                          //gradient: AppTheme.partidaDefault
                        ),
                        child: ListTile(
                          title: Row(
                              children: <Widget>[
                                //Icon(LudoIcons.data_partida, color: Colors.white, size: 17),
                                //Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                                Text(widget.oAlunos[index].nome.toUpperCase() +
                                    " " + widget.oAlunos[index].sobrenome
                                    .toUpperCase(),
                                    style: TextStyle(
                                      color: widget.oAlunos[index].fundoTexto,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppTheme.fDefaultTextFont,
                                      fontSize: 12,
                                    ))
                              ]
                          ),
                          trailing: Icon(Icons.keyboard_arrow_right,
                              color: widget.oAlunos[index].fundoTexto),
                        ),
                      )
                  ),
                );
              }),
        )

    );
  }

  Future scan(AlunoPresenca oAluno) async {
    try {
      String barcode = await BarcodeScanner.scan();

      int lan = oAluno.id + 1000;
      this.barcode = barcode;

      if (lan.toString() == this.barcode) {
        widget.oBlocPresenca.dispatch(PresencaAdd(oAluno: oAluno, context: context));
      }

    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        this.barcode = 'The user did not grant the camera permission!';
      } else {
        this.barcode = 'Unknown error: $e';
      }
    } on FormatException {

      this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)';

      // TEST
      //_setPresencaAluno(index);
      widget.oBlocPresenca.dispatch(PresencaAdd(oAluno: oAluno, context: context));

    } catch (e) {
      this.barcode = 'Unknown error: $e';
    }
  }
}