import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/help/PartidaHelper.dart';
import 'package:ludo_academy/controller/repository/novaPartida/mesas/MesasRepository.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesaJogo.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesasEvent.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesasState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../NovaPartidaBloc.dart';


class MesasBloc extends Bloc<MesasEvent, MesasState> {
  final MesasRepository oMesaRepository;

  MesasBloc({
    @required this.oMesaRepository,
  })  : assert(MesasRepository
      != null);

  MesasState get initialState => MesasUninitialized();

  @override
  Stream<MesasState> mapEventToState(MesasEvent event) async* {
    if (event is MesaAdd) {
      yield MesasLoading();
    }
    if (event is MesaRemove) {
      yield MesasLoading();
    }
    if (event is MesaClear) {
      yield MesasLoading();
    }

    if (event is MesasGeneratorLoad) {
      NovaPartidaBloc oNovaPartida = event.oNovaPartidaBloc;

      if (!oNovaPartida.oNovaPartida.bMesasArranged) {
        oNovaPartida.oNovaPartida.bMesasArranged = true;


        // todo sistema suiço
        ServerResponse r = await oMesaRepository.historicoLoader(nTurmaId: oNovaPartida.oNovaPartida.iTurma);
        print (r.log());




        List<MesaJogo> oMesas = PartidaHelper.doMesasRandom(oNovaPartida.oNovaPartida.lAlunos, oNovaPartida.oNovaPartida.oJogo);






        //print ("GERADOR DE MESAS");

        //print ("mesas length: " + oMesas.length.toString() + ", alunos length: " + oNovaPartida.oNovaPartida.lAlunos.length.toString());


        oNovaPartida.oNovaPartida.lMesas = oMesas;

        int index = 0;
        for (int j = 0; j < oMesas.length; j++) {

          //print ("qtd players da mesa " + oMesas[j].nId.toString() + ": " + oMesas[j].nPlayers.toString());

          for (int k = 0; k < oMesas[j].nPlayers; k++) {

            oNovaPartida.oNovaPartida.addAlunoToMesa(oNovaPartida.oNovaPartida.lAlunos[index].id, oMesas[j].nId);

            index++;
          }
        }
      }

      yield MesasGenerating();

      await new Future.delayed(const Duration(seconds: 1));
      this.dispatch(MesasNovaPartidaLoad());
    }

    if (event is MesasNovaPartidaLoad) {
      yield MesasLoading();

      try {

        yield MesasInitialized();
      }
      catch(error) {
        yield MesasError(sError: error.toString());
      }
    }

      /*try {

        ServerResponse r = await oPresencaRepository.presencaAdd(nId: event.nId, nTurma: event.nTurma);
        int nId = 0;

        nId = r.success;

        Scaffold.of(event.context).hideCurrentSnackBar();
        Scaffold.of(event.context).showSnackBar(
          SnackBar(
            content: Text('Aluno confirmado'),
            backgroundColor: Colors.green,
          ),
        );

        yield PresencaReturn(nId: nId);
      }
      catch(error) {
        yield PresencaError(sError: error.toString());
      }
    }*/
  }

  @override
  // ignore: must_call_super
  void dispose() {
    //super.dispose();
  }

  void reallyDispose() {
    super.dispose();
  }
}