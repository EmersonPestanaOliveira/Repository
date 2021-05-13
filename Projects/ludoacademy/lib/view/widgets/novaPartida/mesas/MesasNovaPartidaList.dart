import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';

class MesasNovaPartidaList extends StatefulWidget {

  @override
  State createState() => new MesasNovaPartidaListStateComponent();
}

class MesasNovaPartidaListStateComponent extends State<MesasNovaPartidaList> {

  NovaPartidaBloc oNovaPartida;

  @override
  void initState() {
    //print ("mesas length: " + widget.oMesas.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    oNovaPartida = BlocProvider.of<NovaPartidaBloc>(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppTheme.cDefaultTextColor2
                    ),
                    color: Colors.white
                ),
                child: ListTile(
                  title: Text("ALUNOS PARA POSICIONAR", textAlign: TextAlign.center,style:
                  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTheme.fDefaultTextFont,
                    fontSize: 16,
                    color: AppTheme.cDefaultTextColor2
                  )),
                ),
              ),
            ),
          ),),
          getAlunosToMove(oNovaPartida),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.cDefaultTextColor2
                    ),
                    color: Colors.white
                  ),
                  child: ListTile(
                    title: Text("MESAS", textAlign: TextAlign.center, style:
                    TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppTheme.fDefaultTextFont,
                        fontSize: 16,
                        color: AppTheme.cDefaultTextColor2
                    )),
                    trailing: Tooltip(
                      message: "Adicione uma nova mesa",
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            oNovaPartida.oNovaPartida.addMesa();

                            Scaffold.of(context).hideCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Mesa adicionada com sucesso'),
                                backgroundColor: Colors.lightGreen,
                              ),
                            );
                          });
                        },
                        child: Icon(Icons.add_circle, color: AppTheme.cDefaultTextColor2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: oNovaPartida.oNovaPartida.lMesas.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: DragTarget(
                      builder: (context, List<AlunoParaMover> candidateData, rejectedData) {
                        //print(candidateData);
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppTheme.getMesaColor(index)
                                    //color: new Color(0xFFFFFFFF)
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: AppTheme.getMesaColor(index)
                                //gradient: AppTheme.partidaDefault
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.all(15),
                                      child: ListTile(
                                        title: Text("MESA " + Application.lAlphabet[index], style:
                                        TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppTheme.fDefaultTextFont,
                                            fontSize: 16,
                                            color: Colors.white
                                        )),
                                        trailing: InkWell(
                                          onTap: () {
                                            setState(() {});
                                            oNovaPartida.oNovaPartida.removeMesa(oNovaPartida.oNovaPartida.lMesas[index]);

                                            Scaffold.of(context).hideCurrentSnackBar();
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Mesa removida com sucesso'),
                                                backgroundColor: Colors.lightGreen,
                                              ),
                                            );
                                          },
                                          child: Icon(Icons.remove_circle, color: Colors.white)
                                        ),
                                      )
                                  ),
                                  getAlunos(oNovaPartida, oNovaPartida.oNovaPartida.lMesas[index].nId),
                                  Divider(
                                    color: Colors.transparent,
                                  )
                                ],
                              ),
                            )
                        );
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (AlunoParaMover data) {

                        var count = oNovaPartida.oNovaPartida.getAlunoCount(oNovaPartida.oNovaPartida.lMesas[index].nId);

                        if (count + 1 <= oNovaPartida.oNovaPartida.oJogo.jogMax) {
                          oNovaPartida.oNovaPartida.addAlunoToMesa(data.id, oNovaPartida.oNovaPartida.lMesas[index].nId);

                          Scaffold.of(context).hideCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Aluno inserido na mesa com sucesso'),
                              backgroundColor: Colors.lightGreen,
                            ),
                          );
                        }
                        else {
                          Scaffold.of(context).hideCurrentSnackBar();
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Mesa cheia'),
                              backgroundColor: Colors.redAccent,
                            ),
                          );
                        }


                        //print ("mesa id: " + oNovaPartida.oNovaPartida.lMesas[index].nId.toString());

                        setState(() {
                          print("update");
                        });
                      },
                    ),
                  );
                }),
          ),
        ],
      )
    );
  }

  Widget getAlunosToMove(NovaPartidaBloc novaPartida) {

    List<AlunoParaMover> oAlunosTemp = new List<AlunoParaMover>();

    for (int i = 0; i < novaPartida.oNovaPartida.lAlunos.length; i++) {

      //print ("n1: " + widget.oAlunos[i].nMesaId.toString());
      //print ("n2: " + mesa.toString());

      if (!novaPartida.oNovaPartida.lAlunos[i].bMesa) {

        AlunoParaMover aluno = new AlunoParaMover();
        aluno.id = novaPartida.oNovaPartida.lAlunos[i].id;
        aluno.nome = novaPartida.oNovaPartida.lAlunos[i].nome;
        aluno.sobrenome = novaPartida.oNovaPartida.lAlunos[i].sobrenome;


        oAlunosTemp.add(aluno);
      }
    }

    if (oAlunosTemp.length == 0) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(child: Text("SEM ALUNOS PARA POSICIONAR",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: AppTheme.fDefaultTextFont,
                            fontWeight: FontWeight.bold
                        ))),
        ),
      );
    }

    return Expanded(
      flex: 2,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: oAlunosTemp.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Draggable(
                    axis: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Center(child: Text(oAlunosTemp[index].nome + " " + oAlunosTemp[index].sobrenome, style:
                      TextStyle(
                          fontSize: 12,
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      )))
                    ),
                    feedback: Container(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Text(oAlunosTemp[index].nome + " " + oAlunosTemp[index].sobrenome,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: AppTheme.fDefaultTextFont,
                                      color: Colors.black
                                    ),),
                      ),
                    ),
                    data: oAlunosTemp[index],
                  ),
                ),

              ),
            );
          }
    ));
  }

  Widget getAlunos(NovaPartidaBloc novaPartida, int mesa) {

    List<AlunoNaMesa> oAlunosTemp = new List<AlunoNaMesa>();

    for (int i = 0; i < novaPartida.oNovaPartida.lAlunos.length; i++) {

      //print ("n1: " + widget.oAlunos[i].nMesaId.toString());
      //print ("n2: " + mesa.toString());

      if (novaPartida.oNovaPartida.lAlunos[i].nMesaId == mesa) {

        AlunoNaMesa aluno = new AlunoNaMesa();
        aluno.id = novaPartida.oNovaPartida.lAlunos[i].id;
        aluno.mesaid = novaPartida.oNovaPartida.lAlunos[i].nMesaId;
        aluno.fundo = novaPartida.oNovaPartida.lAlunos[i].fundo;
        aluno.nome = novaPartida.oNovaPartida.lAlunos[i].nome;
        aluno.sobrenome = novaPartida.oNovaPartida.lAlunos[i].sobrenome;


        oAlunosTemp.add(aluno);
      }
    }

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: oAlunosTemp.length,
        itemBuilder: (context, index) {


            return Dismissible(
              key: Key(oAlunosTemp[index].id.toString()),
              direction: DismissDirection.endToStart,
              background: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppTheme.getMesaColor(oAlunosTemp[index].mesaid)
                          //color: new Color(0xFFFFFFFF)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppTheme.getMesaColor(oAlunosTemp[index].mesaid)
                      //gradient: AppTheme.partidaDefault
                    ),
                    child: ListTile(
                        trailing: Icon(Icons.delete, color: Colors.white
                      ),
                    ),
                  )
              ),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white
                          //color: new Color(0xFFFFFFFF)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white
                      //gradient: AppTheme.partidaDefault
                    ),
                    child: ListTile(
                      title: Row(
                          children: <Widget>[
                            //Icon(LudoIcons.data_partida, color: Colors.white, size: 17),
                            //Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                            Text(oAlunosTemp[index].nome.toUpperCase() + " " +
                                oAlunosTemp[index].sobrenome.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.black,
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
                  NovaPartidaBloc oNovaPartida = BlocProvider.of<NovaPartidaBloc>(context);
                  oNovaPartida.oNovaPartida.removeAlunoFromMesa(oAlunosTemp[index].id, oAlunosTemp[index].mesaid);

                  oAlunosTemp.removeAt(index);
                });
              },
            );
          }
    );
  }
}

class AlunoParaMover {
  int id;
  String nome;
  String sobrenome;
}

class AlunoNaMesa{
  int id;
  int mesaid;
  String nome;
  String sobrenome;
  Color fundo;
}