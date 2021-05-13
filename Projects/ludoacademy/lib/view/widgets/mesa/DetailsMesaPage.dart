import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/help/AlertHelper.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/MesaUsuario.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:ludo_academy/model/partida/DetailsMesaEvent.dart';
import 'package:ludo_academy/view/blocs/partida/DetailsMesaBloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailsMesaPage extends StatefulWidget {
  final List<MesaUsuario> oAlunos;
  final Mesa oMesa;
  final Partida oPartida;

  const DetailsMesaPage({Key key, this.oAlunos, this.oMesa, this.oPartida}) : super(key: key);

  @override
  State createState() => new DetailsMesaPageState();
}

class DetailsMesaPageState extends State<DetailsMesaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, color: AppTheme.cDefaultTextColor2),
          onTap: () {
            Application.kDetailsPartida.currentState.forceUpdate();
            Application.oRouter.pop(context);
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.oPartida.nomeTurma.toUpperCase() + " - ",
                style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.cDefaultTextColor2,
                    fontFamily: AppTheme.fDefaultTextFont,
                    fontWeight: FontWeight.bold
                )),
            Text(widget.oPartida.nomeJogo.toUpperCase(),
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.cDefaultTextColor2,
                  fontFamily: AppTheme.fDefaultTextFont,
                )),
          ],
        ),
        centerTitle: true,
        backgroundColor: new Color(0xFFf1f1f1),
        elevation: 0,

      ),
      body: Container(
        color: new Color(0xFFf1f1f1),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Text("RANKING", textAlign: TextAlign.center, style: TextStyle(
                  fontFamily: AppTheme.fDefaultTextFont,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.cDefaultTextColor2
              ))
            ),
            Expanded(
              flex: 11,
              child: makeAlunosList(),
            ),
            finalizarButton(context),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      )
    );
  }

  Widget makeAlunosList() {
    if (widget.oMesa.status == 2) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.oAlunos.length,
            itemBuilder: (context, index) {

              return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppTheme.cDefaultTextColor2
                          //color: new Color(0xFFFFFFFF)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white
                      //gradient: AppTheme.partidaDefault
                    ),
                    child: ListTile(
                      leading: Text((index+1).toString(), style: TextStyle(
                          fontSize: 16,
                          color: AppTheme.cDefaultTextColor2,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppTheme.fDefaultTextFont
                      )),
                      title: Row(
                          children: <Widget>[
                            //Icon(LudoIcons.data_partida, color: Colors.white, size: 17),
                            //Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                            Text(widget.oAlunos[index].nome.toUpperCase() + " " +
                                widget.oAlunos[index].sobrenome.toUpperCase(),
                                style: TextStyle(
                                  color: AppTheme.cDefaultTextColor2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: AppTheme.fDefaultTextFont,
                                  fontSize: 12,
                                ))
                          ]
                      ),
                    ),
                  )
              );
            }
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.oAlunos.length,
            itemBuilder: (context, index) {

              return Dismissible(
                key: Key(widget.oAlunos[index].id.toString()),
                direction: DismissDirection.vertical,
                background: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppTheme.cDefaultTextColor2
                            //color: new Color(0xFFFFFFFF)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppTheme.cDefaultTextColor2
                        //gradient: AppTheme.partidaDefault
                      ),
                      child: ListTile(
                        title: Icon(Icons.keyboard_arrow_down, color: Colors.white
                        ),
                      ),
                    )
                ),
                secondaryBackground: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppTheme.cDefaultTextColor2
                            //color: new Color(0xFFFFFFFF)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: AppTheme.cDefaultTextColor2
                        //gradient: AppTheme.partidaDefault
                      ),
                      child: ListTile(
                        title: Icon(Icons.keyboard_arrow_up, color: Colors.white
                        ),
                      ),
                    )
                ),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppTheme.cDefaultTextColor2
                            //color: new Color(0xFFFFFFFF)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white
                        //gradient: AppTheme.partidaDefault
                      ),
                      child: ListTile(
                        leading: Text((index+1).toString(), style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.cDefaultTextColor2,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.fDefaultTextFont
                        )),
                        title: Row(
                            children: <Widget>[
                              //Icon(LudoIcons.data_partida, color: Colors.white, size: 17),
                              //Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                              Text(widget.oAlunos[index].nome.toUpperCase() + " " +
                                  widget.oAlunos[index].sobrenome.toUpperCase(),
                                  style: TextStyle(
                                    color: AppTheme.cDefaultTextColor2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTheme.fDefaultTextFont,
                                    fontSize: 12,
                                  ))
                            ]
                        ),
                      ),
                    )
                ),
                onDismissed: (direction) {
                  setState(() {
                    MesaUsuario temp;

                    if (direction == DismissDirection.up) {

                      if (index -1 < 0) {
                        temp = widget.oAlunos.removeAt(index);
                        widget.oAlunos.add(temp);
                      }
                      else {
                        temp = widget.oAlunos.removeAt(index);
                        widget.oAlunos.insert(index - 1, temp);
                      }
                    }
                    else if (direction == DismissDirection.down) {
                      if (index + 1 >= widget.oAlunos.length) {
                        temp = widget.oAlunos.removeAt(index);
                        widget.oAlunos.insert(0, temp);
                      }
                      else {
                        temp = widget.oAlunos.removeAt(index);
                        widget.oAlunos.insert(index + 1, temp);
                      }
                    }

                    //NovaPartidaBloc oNovaPartida = BlocProvider.of<NovaPartidaBloc>(context);
                    //oNovaPartida.oNovaPartida.removeAlunoFromMesa(oAlunosTemp[index].id, oAlunosTemp[index].mesaid);

                    //oAlunosTemp.removeAt(index);
                  });
                },
              );
            }
        ),
      );
    }
  }

  Widget finalizarButton(BuildContext c) {

    if (widget.oMesa.status == 1) {
      return Expanded(
          flex: 1,
          child: Row (
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  showConfirmAlert(c);
                },
                child: Text("FINALIZAR MESA", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: AppTheme.fDefaultTextFont,
                    fontSize: 14
                )),
                color: AppTheme.cDefaultTextColor2,
              )
            ],
          )
      );
    }
    else {
      return Container();
    }


  }

  void showConfirmAlert(BuildContext c2) {
    List<DialogButton> _buttons = new List<DialogButton>();
    _buttons.addAll([
      DialogButton(
          radius: BorderRadius.all(Radius.circular(0)),
          child: Text(
              "SIM",
              style: AppTheme.botaoSim
          ),
          onPressed: () {
            Navigator.pop(c2);
            DetailsMesaBloc oDetailsMesaBloc = BlocProvider.of<DetailsMesaBloc>(c2);
            oDetailsMesaBloc.dispatch(DetailsFecharMesa(widget.oAlunos, widget.oMesa, widget.oPartida, c2));
          },
          color: AppTheme.cDefaultTextColor2
      ),
      DialogButton(
        radius: BorderRadius.all(Radius.circular(0)),
        child: Text(
            "NÃO",
            style: AppTheme.botaoNao
        ),
        onPressed: () => Navigator.pop(context),
        color: AppTheme.cDefaultTextColor2,
      ),
    ]);

    AlertStyle _style = AppTheme.alertaStyle;

    AlertHelper.showAlert(context, "FINALIZAR MESA", "Deseja finalizar a mesa?",
        _buttons, _style, this);
  }
}