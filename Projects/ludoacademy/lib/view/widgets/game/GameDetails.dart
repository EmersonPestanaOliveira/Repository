import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/help/AlertHelper.dart';
import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:ludo_academy/model/game/GameEvent.dart';
import 'package:ludo_academy/view/blocs/game/GameBloc.dart';
import 'package:ludo_academy/view/widgets/VideoPlayerScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetails extends StatefulWidget {
  final Jogo oJogo;

  const GameDetails({Key key, this.oJogo}) : super(key: key);

  @override
  State createState() => new GameDetailsState();
}

class GameDetailsState extends State<GameDetails> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Application.kDetailsGame.currentState.changeTitle(widget.oJogo.nome.toUpperCase());



    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row (
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(Application.lPerfil1[widget.oJogo.id], style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: AppTheme.fDefaultTextFont,
                        color: Colors.white
                      )),
                      Text(Application.lPerfil2[widget.oJogo.id], style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          fontFamily: AppTheme.fDefaultTextFont,
                          color: Colors.white
                      ))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppTheme.cDefaultTextColor2
                    ),
                    color: AppTheme.cDefaultTextColor2
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4.8,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.supervised_user_circle, color: AppTheme.cDefaultTextColor2),
                      Text(widget.oJogo.jogMin.toString() + " a " + widget.oJogo.jogMax.toString() + "\njogadores", textAlign: TextAlign.center,
                           style: TextStyle(
                             fontSize: 10,
                             fontWeight: FontWeight.bold,
                             fontFamily: AppTheme.fDefaultTextFont,
                             color: AppTheme.cDefaultTextColor2
                           ))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppTheme.cDefaultTextColor2
                    ),
                    color: Colors.white
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4.8,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.timer, color: AppTheme.cDefaultTextColor2),
                      Text(widget.oJogo.tempo.toString() + "\nminutos", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fDefaultTextFont,
                              color: AppTheme.cDefaultTextColor2
                          ))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppTheme.cDefaultTextColor2
                    ),
                    color: Colors.white
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4.8,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.child_care, color: AppTheme.cDefaultTextColor2),
                      Text("\n+" + widget.oJogo.idade.toString(), textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppTheme.fDefaultTextFont,
                              color: AppTheme.cDefaultTextColor2
                          ))
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppTheme.cDefaultTextColor2
                    ),
                    color: Colors.white
                ),
              )
            ],
          ),
          // imagem
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/spinningwheel.gif',
            image: Application.sUrlApi + "/img/jogos/" + widget.oJogo.caixa,
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
          ),
          // aprenda como jogar
          ListTile(
            title: Text("APRENDA A JOGAR",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTheme.fDefaultTextFont,
                    color: AppTheme.cDefaultTextColor2
                )),
            trailing: Icon(Icons.keyboard_arrow_down, color: AppTheme.cDefaultTextColor2),
          ),
          VideoPlayerScreen(url: widget.oJogo.video),
          Divider(
            color: Colors.transparent,
          ),
          // componentes
          Container(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            decoration: BoxDecoration(
              color: AppTheme.cDefaultTextColor2,
              border: Border.all(
                color: AppTheme.cDefaultTextColor2
              )
            ),
            child: ListTile(
              title: Text("COMPONENTES",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppTheme.fDefaultTextFont,
                      color: Colors.white
                  )),
              subtitle: Text(widget.oJogo.componentes,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppTheme.fDefaultTextFont,
                      color: Colors.white
                  )),
              trailing: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: AppTheme.cDefaultTextColor2
              )
            ),
            child: InkWell(
              onTap: () {
                launchURL(widget.oJogo.manual);
              },
              child: ListTile(
                title: Text("MANUAL DE REGRAS",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: AppTheme.fDefaultTextFont,
                        color: AppTheme.cDefaultTextColor2
                    )),
                trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.cDefaultTextColor2),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: RaisedButton(
              color: AppTheme.cDefaultTextColor2,
              onPressed: () {
                showSolicitacaoAlert();
              },
              child: Text("SOLICITAR JOGO",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppTheme.fDefaultTextFont,
                      color: Colors.white
                  )),
            ),
          )
          // manual de regras
        ],
      ));
  }

  void showSolicitacaoAlert() {
    List<DialogButton> _buttons = new List<DialogButton>();
    _buttons.addAll([
      DialogButton(
          radius: BorderRadius.all(Radius.circular(0)),
          child: Text(
              "SIM",
              style: AppTheme.botaoSim
          ),
          onPressed: () {
            BlocProvider.of<GameBloc>(context).dispatch(SaveSolicitacao(escolaId: Application.oProfile.escolaId,
                usuarioId: Application.oProfile.usuarioId,
                jogoId: widget.oJogo.id));
            Navigator.pop(context);
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

    AlertHelper.showAlert(context, "SOLICITAR JOGO", "Deseja solicitar esse jogo\npara sua escola?",
        _buttons, _style, this);
  }

  launchURL(String url) async {


    bool c = await canLaunch(url);

    if (c) {
      try {
        await launch(url);
      }
      catch(error) {
        print (error);
      }
    }
  }
}