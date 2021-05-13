import 'package:crudapp/bloc/screen_Home_Bloc.dart';
import 'package:crudapp/screens/screen_Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  ScreenHomeBloc bloc = ScreenHomeBloc();
  List<String> entries = [];

  @override
  void initState() {
    bloc.LoadingDatabase();

    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    if(bloc.dados != null) {
      for ( List<dynamic>itens  in bloc.dados) {

      }
    }
    print(itens.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF3862F5),
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              "Crud Flutter",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
          )),
      body: Container(
        color: Color(0xFFCDCEF2),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01),
                    child: FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: FlatButton(
                                color: Colors.white,
                                shape: CircleBorder(
                                  side: BorderSide(
                                      color: Colors.black,
                                      width: 3,
                                      style: BorderStyle.solid),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScreenRegister()));
                                },
                                child: Icon(Icons.add),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.001),
                            ),
                            Text("Adicionar Usuário"),
                          ],
                        )),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 2,
                    width: MediaQuery.of(context).size.width * 3,
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.01),
                      child: ListView.builder(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.03),
                          itemCount: bloc.dados.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<dynamic> ListaItens = bloc.dados;
                            ListaItens[index] = bloc.dados[index];
                            return Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 1,
                                width: MediaQuery.of(context).size.width * 1,
                                // color: Colors.blue[colorCodes[index]],
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                              0,
                                              0,
                                              0),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.01),
                                                ),
                                                Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            1,
                                                    color:
                                                        Colors.deepPurple[100],
                                                    child: FittedBox(
                                                      fit: BoxFit.contain,
                                                      child: Icon(
                                                        Icons.person,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 2,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            2,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .all(MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                1,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: Text(
                                                                  "nome: Emerson + ${ListaItens[index]}" ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                1,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: Text(
                                                                  "idade: 31"),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.01),
                                                ),
                                                Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            3,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            3,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .all(MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.01),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                1,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: FlatButton(
                                                                onPressed: () {
                                                                  print("xx");
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .border_color,
                                                                  size: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.2,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 2,
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                3,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                3,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .contain,
                                                              child: FlatButton(
                                                                onPressed: () {
                                                                  print(
                                                                      "deete");
                                                                },
                                                                child: Icon(
                                                                  Icons.delete,
                                                                  size: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.1,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  flex: 2,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            3,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
