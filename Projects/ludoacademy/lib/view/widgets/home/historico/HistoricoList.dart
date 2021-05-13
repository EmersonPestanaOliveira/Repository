import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:date_format/date_format.dart';
import 'package:ludo_academy/view/fonts/ludo_icons_icons.dart';

class HistoricoList extends StatefulWidget {
  final List<Partida> items;

  HistoricoList({Key key, @required this.items}) : super(key: key);

  @override
  State createState() => new HistoricoListStateComponent();
}

class HistoricoListStateComponent extends State<HistoricoList> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
    child: ListView.builder(

        physics: BouncingScrollPhysics(),
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          //return Text(items[index].nome.toUpperCase());

          Color cFundo;
          Color cBorda;
          Color cTexto;

          if (widget.items[index].status == 1) {
            cFundo = Colors.white;
            cBorda = Colors.redAccent;
            cTexto = Colors.black;
          }
          else {
            cFundo = new Color(0xFF089EDD);
            cBorda = new Color(0xFF089EDD);
            cTexto = Colors.white;
          }

          return InkWell(
            onTap: () {
              //Application.kHome.currentState.forceUpdate();
              Application.oRouter.navigateTo(
                  context,
                  '/partida/' + widget.items[index].id.toString(),
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
                    color: cBorda
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: cFundo
                  //gradient: AppTheme.partidaDefault
                ),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(LudoIcons.data_partida, color: cTexto, size: 17),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
                      Text(convertDateFromString(widget.items[index].data), style: TextStyle(
                          color: cTexto,
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontSize: 12
                      ))
                    ],
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Text(widget.items[index].nomeTurma.toUpperCase() + " - ", style: TextStyle(
                          color: cTexto,
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontSize: 12
                      )),
                      Text(widget.items[index].nomeJogo.toUpperCase(), style: TextStyle(
                          color: cTexto,
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontSize: 12
                      ))
                    ],
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right, color: cTexto),
                ),
              )
            ),
          );
        })
  );

  String convertDateFromString(String strDate){
    DateTime todayDate = DateTime.parse(strDate);
    return formatDate(todayDate, [dd, ' - ', mm, ' - ', yyyy]);
  }
}