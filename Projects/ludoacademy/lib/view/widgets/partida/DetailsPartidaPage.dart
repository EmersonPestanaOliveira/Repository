import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/help/AlertHelper.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:ludo_academy/model/partida/DetailsPartidaEvent.dart';
import 'package:ludo_academy/view/blocs/partida/DetailsPartidaBloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DetailsPartidaPage extends StatefulWidget {
  final List<Mesa> oMesas;
  final Partida oPartida;

  const DetailsPartidaPage({Key key, this.oMesas, this.oPartida}) : super(key: key);

  @override
  State createState() => new DetailsPartidaPageState();
}

class DetailsPartidaPageState extends State<DetailsPartidaPage> {

  Duration dTimer = Duration(seconds:1);
  Timer oTimer;

  @override
  void initState() {
    super.initState();

    oTimer = new Timer.periodic(dTimer, (Timer t) {
      setState(() {
        //BlocProvider.of<DetailsPartidaBloc>(context).dispatch(DetailsPartidaLoad(widget.oPartida.id));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    oTimer.cancel();
  }

  void forceUpdate() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios, color: AppTheme.cDefaultTextColor2),
            onTap: () {
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
                      fontFamily: "montserrat",
                      fontWeight: FontWeight.bold
                  )),
              Text(widget.oPartida.nomeJogo.toUpperCase(),
                  style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.cDefaultTextColor2,
                      fontFamily: "montserrat",
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
            getBotaoFinalizar(),
            getDivider(),
            Expanded(
                child: Center(child: Text("MESAS", style: TextStyle(
                  fontFamily: AppTheme.fDefaultTextFont,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.cDefaultTextColor4,
                )))
            ),
            Expanded(
                flex: 10,
                child: buildMesas()
            ),
            Expanded(
              flex: 1,
              child: Divider(),
            ),
          ],
        ),
      )
    );
  }

  Widget getDivider() {
    if (widget.oPartida.status == 1) {
      return Expanded(
        flex: 1,
        child: Divider(),
      );
    }
    else {
      return Container();
    }

  }

  Widget getBotaoFinalizar() {

    if (widget.oPartida.status == 1) {
      return Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: AppTheme.cDefaultTextColor2
              )
          ),
          child: ListTile(
            onTap: () {
              showConfirmAlert();
            },
            title: Text("FINALIZAR PARTIDA",
              style: TextStyle(
                  fontFamily: AppTheme.fDefaultTextFont,
                  color: AppTheme.cDefaultTextColor2,
                  fontWeight: FontWeight.bold,
                  fontSize: 12
              ),),
            trailing: Icon(
                Icons.arrow_forward_ios, color: AppTheme.cDefaultTextColor2),
          ));
    }
    else {
      return Container();
    }
  }

  Widget buildMesas() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (200/150),
      children: List.generate(
        widget.oMesas.length,
        (index) {

          String finalizado = "";

          if (widget.oMesas[index].status == 2) {
            finalizado = "FINALIZADA";
          }

          return InkWell(
            onTap: () {
              Application.oRouter.navigateTo(
                  context,
                  '/mesa/' + widget.oMesas[index].id.toString() + "/" + widget.oPartida.id.toString(),
                  transition:
                  TransitionType
                      .inFromRight)
                  .then((result) {

              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: AppTheme.getMesaColor(index)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("MESA " + Application.lAlphabet[index], style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: AppTheme.fDefaultTextFont,
                      fontSize: 16
                  )),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.getMesaColor(index)
                      )
                    ),
                    child: Text(convertDateFromString(widget.oMesas[index].data, widget.oMesas[index].alteracao, widget.oMesas[index].status), style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: AppTheme.fDefaultTextFont,
                        fontSize: 12
                    )),
                  ),
                  Text(finalizado, style:
                        TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontSize: 10
                        )),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  void showConfirmAlert() {
    List<DialogButton> _buttons = new List<DialogButton>();
    _buttons.addAll([
      DialogButton(
          radius: BorderRadius.all(Radius.circular(0)),
          child: Text(
              "SIM",
              style: AppTheme.botaoSim
          ),
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<DetailsPartidaBloc>(context).dispatch(DetailsPartidaFechar(widget.oMesas, widget.oPartida, context));
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

    AlertHelper.showAlert(context, "FINALIZAR PARTIDA", "Deseja finalizar a partida?",
        _buttons, _style, this);
  }

  String convertDateFromString(String data, String alteracao, int status){
    DateTime now = DateTime.now();
    //now = now.subtract(Duration(hours: 3));
    DateTime then = DateTime.parse(data);

    DateTime then2 = DateTime.parse(alteracao);

    Duration tsNow = Duration(milliseconds: now.millisecondsSinceEpoch);
    Duration tsThen = Duration(milliseconds: then.millisecondsSinceEpoch);
    Duration tsThen2 = Duration(milliseconds: then2.millisecondsSinceEpoch);

    DateTime f1 = DateTime.fromMillisecondsSinceEpoch(tsNow.inMilliseconds);
    DateTime f2 = DateTime.fromMillisecondsSinceEpoch(tsThen.inMilliseconds);
    DateTime f3 = DateTime.fromMillisecondsSinceEpoch(tsThen2.inMilliseconds);

    Duration tsResult = f1.difference(f2);
    Duration tsResult2 = f3.difference(f2);

    //print (tsResult.inMinutes);
    //print (tsResult2.inMinutes);

    if (status == 1) {
      return getFormattedTime(tsResult.inSeconds);
    }

    return getFormattedTime(tsResult2.inSeconds);
  }

  String getFormattedTime(int totalSeconds) {

    if (totalSeconds < 0) {
      return "00:00:00";
    }

    int remainingHours = (totalSeconds / 3600).floor();
    int remainingMinutes = (totalSeconds / 60).floor() - remainingHours * 60;
    int remainingSeconds = totalSeconds - remainingMinutes * 60 - remainingHours * 3600;

    return remainingHours.toString().padLeft(2, '0') +
        ":" +
        remainingMinutes.toString().padLeft(2, '0') +
        ":" +
        remainingSeconds.toString().padLeft(2, '0');
  }
}