import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/repository/home/alunos/AlunosRepository.dart';
import 'package:ludo_academy/model/home/alunos/AlunosState.dart';
import 'package:ludo_academy/model/home/alunos/AlunosEvent.dart';
import 'package:ludo_academy/model/home/alunos/TurmaEvent.dart';
import 'package:ludo_academy/model/home/alunos/TurmaState.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/presenca/PresencaBloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'TurmaBloc.dart';


class AlunosBloc extends Bloc<AlunosEvent, AlunosState> {
  final AlunosRepository oAlunosRepository;
  final TurmaBloc oTurmaBloc;
  final PresencaBloc oPresencaBloc;

  StreamSubscription oTurmaSubscription;
  StreamSubscription oPresencaSubscription;

  AlunosBloc({
    @required this.oAlunosRepository,
    @required this.oTurmaBloc,
    @required this.oPresencaBloc
  })  : assert(AlunosRepository != null) {

      oTurmaSubscription = oTurmaBloc.state.listen((state) {
        if (state.toString() == 'TurmaSelected') {

          if (sTurmaSelected != (state as TurmaSelected).sTurmaSelected) {
            sTurmaSelected = (state as TurmaSelected).sTurmaSelected;

            if (oNovaPartidaBloc != null) {
              oNovaPartidaBloc.oNovaPartida.clearAlunos();
              oNovaPartidaBloc.oNovaPartida.clearMesas();
              oNovaPartidaBloc.oNovaPartida.bMesasArranged = false;
            }

          }
          else {

          }


          print ("escolheu: " + (state as TurmaSelected).sTurmaSelected);
          this.dispatch(AlunosLoad(true));
          oTurmaBloc.dispatch(TurmaLoad());
        }
      });

      oPresencaSubscription = oPresencaBloc.state.listen((state) {
        if (state.toString() == 'PresencaReturn') {
          this.dispatch(AlunosLoad(false));
        }
      });
  }

  AlunosState get initialState => AlunosUninitialized();

  bool bUpdateTurma = true;
  String sTurmaSelected;
  NovaPartidaBloc oNovaPartidaBloc;

  @override
  Stream<AlunosState> mapEventToState(AlunosEvent event) async* {
    if (event is AlunosLoad) {
      yield AlunosLoading();

      try {
        ServerResponse r = await oAlunosRepository.alunosLoader(turma: sTurmaSelected);
        List<AlunoPresenca> oAlunos = new List<AlunoPresenca>();

        if (r.data != null && r.data.length > 0) {
          r.data.forEach((item) {

            if (int.parse(item['usuario_presenca']) > 0) {
              item['usuario_fundo'] = Colors.white;
              item['usuario_textoFundo'] = AppTheme.cDefaultTextColor2;
            }
            else {
              item['usuario_fundo'] = new Color(0xFFebebeb);
              item['usuario_textoFundo'] = new Color(0xFFa3a3a3);

            }

            oAlunos.add(new AlunoPresenca.fromJson(item));
          });
        }

        if (event.bUpdatePresenca && oNovaPartidaBloc != null) {

          print ("e ai");


          oAlunos.forEach((item) {
            if (item.presenca > 0) {
              oNovaPartidaBloc.oNovaPartida.addAluno(item);
            }
          });
        }


        if (oAlunos.length > 0) {
          yield AlunosInitialized(oAlunos: oAlunos);
        }
        else {
          yield AlunosEmpty();
        }
      }
      catch(error) {
        yield AlunosError(sError: error.toString());
      }
    }
  }

  @override
  // ignore: must_call_super
  void dispose() {
    //oTurmaSubscription.cancel();
    //oPresencaSubscription.cancel();
    //super.dispose();
  }

  void reallyDispose() {
    oTurmaSubscription.cancel();
    oPresencaSubscription.cancel();
    super.dispose();
  }
}