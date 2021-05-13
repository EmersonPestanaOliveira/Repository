import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/repository/novaPartida/presenca/PresencaRepository.dart';
import 'package:ludo_academy/model/novaPartida/presenca/PresencaEvent.dart';
import 'package:ludo_academy/model/novaPartida/presenca/PresencaState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../NovaPartidaBloc.dart';


class PresencaBloc extends Bloc<PresencaEvent, PresencaState> {
  final PresencaRepository oPresencaRepository;

  PresencaBloc({
    @required this.oPresencaRepository,
  })  : assert(PresencaRepository
      != null);

  PresencaState get initialState => PresencaUninitialized();

  String sTurmaSelected;

  @override
  Stream<PresencaState> mapEventToState(PresencaEvent event) async* {
    if (event is PresencaAdd) {
      yield PresencaLoading();

      try {

        int nAlunoId = event.oAluno.id;
        int nTurmaId = event.oAluno.turmaId.toInt();

        ServerResponse r = await oPresencaRepository.presencaAdd(nId: nAlunoId, nTurma: nTurmaId);
        int nId = 0;

        // TODO mensagem de erro

        nId = r.success;

        Scaffold.of(event.context).hideCurrentSnackBar();

        if (r.success == 1) {

          print ("PASSOU POR AQUI 2");
          NovaPartidaBloc oBlocNovaPartida = BlocProvider.of<NovaPartidaBloc>(event.context);
          oBlocNovaPartida.oNovaPartida.addAluno(event.oAluno);


          Scaffold.of(event.context).showSnackBar(
            SnackBar(
              content: Text('Aluno confirmado'),
              backgroundColor: Colors.green,
            ),
          );
        }
        else {
          Scaffold.of(event.context).showSnackBar(
            SnackBar(
              content: Text('Erro ao confirmar presença'),
              backgroundColor: Colors.red,
            ),
          );
        }
        yield PresencaReturn(nId: nId);
      }
      catch(error) {
        yield PresencaError(sError: error.toString());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}