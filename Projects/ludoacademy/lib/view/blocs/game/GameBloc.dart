import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/repository/game/GameRepository.dart';
import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:ludo_academy/model/game/GameEvent.dart';
import 'package:ludo_academy/model/game/GameState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository oGameRepository;

  GameBloc({
    @required this.oGameRepository,
  })  : assert(GameRepository != null);

  GameState get initialState => GameUninitialized();

  Jogo oJogo;

  @override
  Stream<GameState> mapEventToState(GameEvent event) async* {
    if (event is GameEventLoad) {
      yield GameLoading();

      try {
        print ("game id: " + event.jogoId.toString());
        ServerResponse r = await oGameRepository.jogoLoader(nId: event.jogoId);

        print (r.log());

        oJogo = Jogo.fromJson(r.data[0]);

        yield GameInitialized(oJogo: oJogo);
      }
      catch(error) {
        yield GameError(sError: error.toString());
      }
    }

    if (event is SaveSolicitacao) {
      yield GameLoading();

      try {
        ServerResponse r = await oGameRepository.saveSolicitacao(event.escolaId, event.usuarioId, event.jogoId);

        if (r.success == 1) {
          dispatch(GameEventLoad(event.jogoId));
        }
        else {
          yield GameError(sError: "Erro ao gravar solicitação");
        }

      }
      catch(error) {
        yield GameError(sError: error);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}