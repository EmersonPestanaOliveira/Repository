import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';

class AlunosList extends StatelessWidget {

  final List<AlunoPresenca> oAlunos;

  AlunosList({Key key, @required this.oAlunos}) : super(key: key);


  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      //margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 1.7
        ),
        child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: oAlunos.length,
            itemBuilder: (context, index) {
              //return Text(items[index].nome.toUpperCase());
              return InkWell(
                onTap: () {
                  Application.oRouter.navigateTo(
                      context,
                      '/user/' + oAlunos[index].id.toString(),
                      //'/soon',
                      transition:
                      TransitionType
                          .inFromRight)
                      .then((result) {

                  });

                },
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: new Color(0xFFFFFFFF)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: new Color(0xFFFFFFFF)
                        //gradient: AppTheme.partidaDefault
                      ),
                      child: ListTile(
                        title: Row(
                          children: <Widget>[
                            //Icon(LudoIcons.data_partida, color: Colors.white, size: 17),
                            //Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                            Text(oAlunos[index].nome.toUpperCase() + " " + oAlunos[index].sobrenome.toUpperCase(), style: AppTheme.tsDefaultBoldTextStyle3)
                          ]
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right, color: AppTheme.cDefaultTextColor2),
                      ),
                    )
                ),
              );
            }),
      )
  );
}