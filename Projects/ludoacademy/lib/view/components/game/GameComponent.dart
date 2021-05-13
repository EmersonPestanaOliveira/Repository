import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/view/blocs/game/GameBloc.dart';
import 'package:ludo_academy/view/widgets/game/Game.dart';
import 'package:ludo_academy/model/game/GameEvent.dart';

class GameComponent extends StatefulWidget {

  final String id;

  const GameComponent({Key key, this.id}) : super(key: key);

  @override
  State createState() => new GameComponentState();
}

class GameComponentState extends State<GameComponent>
{
  String sTitle = "DETALHES DO JOGO";

  void changeTitle(String value) {
    //setState(() {
      sTitle = value;
    //});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Text(sTitle),
          centerTitle: true,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
            onTap: () {
              Application.kHome.currentState.forceUpdate();
              Application.oRouter.pop(context);
            },
          ),
          backgroundColor: new Color(0xFF00b4ff),
          elevation: 0,
        ),
        resizeToAvoidBottomPadding: false,
        body: BlocProvider<GameBloc>(
            builder: (context) {
              return GameBloc(oGameRepository: Application.oRepositoryGame)..dispatch(GameEventLoad(int.parse(widget.id)));
            },
            child: Game()
        ));
  }
}