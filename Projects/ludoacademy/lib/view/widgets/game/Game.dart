import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/game/GameEvent.dart';
import 'package:ludo_academy/model/game/GameState.dart';
import 'package:ludo_academy/view/blocs/game/GameBloc.dart';
import 'package:ludo_academy/view/widgets/DefaultError.dart';
import 'package:ludo_academy/view/widgets/DefaultLoading.dart';
import 'package:ludo_academy/view/widgets/game/GameDetails.dart';

class Game extends StatefulWidget {

  @override
  State createState() {
    return new GameWidgetState();
  }
}

class GameWidgetState extends State<Game> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SafeArea(
            top: false,
            bottom: false,
            child: Container (
              color: new Color(0xFFf1f1f1),
              child: BlocBuilder<GameEvent, GameState>(
                bloc: BlocProvider.of<GameBloc>(context),
                builder: (BuildContext context, GameState state) {
                  if (state is GameUninitialized) {
                    return DefaultLoading();
                  }
                  if (state is GameLoading) {
                    return DefaultLoading();
                  }
                  if (state is GameEmpty) {
                    return DefaultLoading();
                  }
                  if (state is GameInitialized) {
                    return GameDetails(oJogo: state.oJogo);
                  }
                  if (state is GameError) {
                    return DefaultError(sError: state.sError);
                  }
                },
              ),
            )
        )
    );
  }
}

