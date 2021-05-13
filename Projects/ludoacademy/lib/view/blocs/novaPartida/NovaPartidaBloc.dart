import 'dart:async';

import 'package:ludo_academy/controller/repository/novaPartida/NovaPartidaRepository.dart';
import 'package:ludo_academy/model/novaPartida/NovaPartida.dart';
import 'package:ludo_academy/model/novaPartida/NovaPartidaEvent.dart';
import 'package:ludo_academy/model/novaPartida/NovaPartidaState.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class NovaPartidaBloc extends Bloc<NovaPartidaEvent, NovaPartidaState> {
  final NovaPartidaRepository oNovaPartidaRepository;

  NovaPartida _oNovaPartida = new NovaPartida();

  // ignore: unnecessary_getters_setters
  NovaPartida get oNovaPartida => _oNovaPartida;

  // ignore: unnecessary_getters_setters
  set oNovaPartida(NovaPartida oNovaPartida) {
    _oNovaPartida = oNovaPartida;
  }

  NovaPartidaBloc({
    @required this.oNovaPartidaRepository,
  })  : assert(NovaPartidaRepository != null);

  NovaPartidaState get initialState => NovaPartidaJogos();

  @override
  Stream<NovaPartidaState> mapEventToState(NovaPartidaEvent event) async* {
    if (event is NovaPartidaJogosLoad) {
      yield NovaPartidaLoading();

      try {
        yield NovaPartidaJogos();
      }
      catch(error) {
        yield NovaPartidaError(sError: error.toString());
      }
    }
    if (event is NovaPartidaTurmaBackLoad) {
      yield NovaPartidaLoading();

      try {
        yield NovaPartidaTurma();
      }
      catch(error) {
        yield NovaPartidaError(sError: error.toString());
      }
    }
    if (event is NovaPartidaTurmaLoad) {
      yield NovaPartidaLoading();

      try {
        yield NovaPartidaTurma();
      }
      catch(error) {
        yield NovaPartidaError(sError: error.toString());
      }
    }
    if (event is NovaPartidaAlunosLoad) {
      yield NovaPartidaLoading();

      try {
        yield NovaPartidaAlunos();
      }
      catch(error) {
        yield NovaPartidaError(sError: error.toString());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void reallyDispose() {
    super.dispose();
  }
}