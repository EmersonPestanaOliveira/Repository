import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/repository/partida/DetailsPartidaRepository.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:ludo_academy/model/partida/DetailsPartidaEvent.dart';
import 'package:ludo_academy/model/partida/DetailsPartidaState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class DetailsPartidaBloc extends Bloc<DetailsPartidaEvent,DetailsPartidaState> {
  final DetailsPartidaRepository oDetailsPartidaRepository;

  DetailsPartidaBloc({
    @required this.oDetailsPartidaRepository
  })  : assert(DetailsPartidaRepository != null);

  DetailsPartidaState get initialState => DetailsPartidaUninitialized();

  @override
  Stream<DetailsPartidaState> mapEventToState(DetailsPartidaEvent event) async* {
    yield DetailsPartidaLoading();

    if (event is DetailsPartidaReset) {
      yield DetailsPartidaLoading();

      try {
        await new Future.delayed(const Duration(milliseconds: 100));
        dispatch(DetailsPartidaLoad(event.nPartidaId));
      }
      catch(error) {
        yield DetailsPartidaError(sError: error.toString());
      }
    }

    if (event is DetailsPartidaLoad) {
      try {
        ServerResponse s = await oDetailsPartidaRepository.partidaLoader(partidaId: event.nPartidaId);

       // print(s.data[0]);

        Partida oPartida = Partida.fromJson(s.data[0]);

        ServerResponse s2 = await oDetailsPartidaRepository.mesasLoader(partidaId: event.nPartidaId);

        List<Mesa> oMesas = new List<Mesa>();

        s2.data.forEach((item) {
          oMesas.add(new Mesa.fromJson(item));
        });

        yield DetailsPartidaInitialized(oMesas: oMesas, oPartida: oPartida);
      }
      catch(error) {
        yield DetailsPartidaError(sError: error.toString());
      }
    }
    if (event is DetailsPartidaFechar) {
      yield DetailsPartidaLoading();

      try {
        ServerResponse s = await oDetailsPartidaRepository.fecharPartida(partidaId: event.oPartida.id);

        if (s.success == 1) {
          Scaffold.of(Application.kHome.currentContext).hideCurrentSnackBar();
          Scaffold.of(Application.kHome.currentContext).showSnackBar(
            SnackBar(
              content: Text('Partida finalizada com sucesso'),
              backgroundColor: Colors.lightGreen,
            ),
          );

          Application.oRouter.pop(Application.kDetailsPartida.currentContext);
          Application.kHome.currentState.forceUpdate();
          //Application.oRouter.pop(event.oContext);
        }
        else {
          Scaffold.of(Application.kDetailsPartida.currentContext).hideCurrentSnackBar();
          Scaffold.of(Application.kDetailsPartida.currentContext).showSnackBar(
            SnackBar(
              content: Text(s.error.toUpperCase()),
              backgroundColor: Colors.redAccent,
            ),
          );
        }

        yield DetailsPartidaInitialized(oPartida: event.oPartida, oMesas: event.oMesas);
      }
      catch(error) {
        yield DetailsPartidaError(sError: error.toString());
      }
    }
  }
}