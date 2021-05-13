import 'dart:async';

import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/repository/home/alunos/TurmaRepository.dart';
import 'package:ludo_academy/model/database/Turma.dart';
import 'package:ludo_academy/model/home/alunos/TurmaEvent.dart';
import 'package:ludo_academy/model/home/alunos/TurmaState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class TurmaBloc extends Bloc<TurmaEvent, TurmaState> {
  final TurmaRepository oTurmaRepository;

  TurmaBloc({
    @required this.oTurmaRepository
  })  : assert(TurmaRepository != null);

  TurmaState get initialState => TurmaUninitialized();

  String sDefaultValue = "-1";
  String sDefaultName = "";

  @override
  Stream<TurmaState> mapEventToState(TurmaEvent event) async* {
    if (event is TurmaLoad) {
      yield TurmaLoading();

      try {
        ServerResponse r = await oTurmaRepository.turmaLoader(usuario: Application.oProfile.usuarioId.toString(), escola: Application.oProfile.escolaId.toString());
        List<Turma> oTurmas = new List<Turma>();

        if (r.data != null && r.data.length > 0) {
          r.data.forEach((item) {
            oTurmas.add(new Turma.fromJson(item));
          });
        }

        if (oTurmas.length > 0) {
          yield TurmaInitialized(oTurmas: oTurmas);
        }
        else {
          yield TurmaEmpty();
        }
      }
      catch(error) {
        yield TurmaError(sError: error);
      }
    }
    if (event is TurmaSelect) {
      sDefaultValue = event.turmaSelected;
      sDefaultName = event.nomeSelected;
      yield TurmaSelected(sTurmaSelected: event.turmaSelected);
    }
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