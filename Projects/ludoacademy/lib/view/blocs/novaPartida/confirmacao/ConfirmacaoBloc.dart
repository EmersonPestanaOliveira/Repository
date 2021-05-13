import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/repository/novaPartida/confirmacao/ConfirmacaoRepository.dart';
import 'package:ludo_academy/model/novaPartida/confirmacao/ConfirmacaoEvent.dart';
import 'package:ludo_academy/model/novaPartida/confirmacao/ConfirmacaoState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class ConfirmacaoBloc extends Bloc<ConfirmacaoEvent, ConfirmacaoState> {
  final ConfirmacaoRepository oConfirmacaoRepository;

  ConfirmacaoBloc({
    @required this.oConfirmacaoRepository,
  })  : assert(ConfirmacaoRepository
      != null);

  ConfirmacaoState get initialState => ConfirmacaoUninitialized();

  @override
  Stream<ConfirmacaoState> mapEventToState(ConfirmacaoEvent event) async* {
    if (event is ConfirmacaoLoad) {
      yield ConfirmacaoLoading();

      try {
        yield ConfirmacaoInitialized(oNovaPartidaBloc: event.oNovaPartida);
      }
      catch(error) {
        yield ConfirmacaoError(sError: error.toString());
      }
    }
    if (event is AddPartida) {
        Map<String, dynamic> dados = new Map<String, dynamic>();
        dados['partida_turma_id'] = event.oNovaPartida.oNovaPartida.iTurma;
        dados['partida_jogo_id'] = event.oNovaPartida.oNovaPartida.oJogo.id;
        dados['partida_usuario_id'] = Application.oProfile.usuarioId;
        dados['partida_escola_id'] = Application.oProfile.escolaId;
        dados['partida_num_mesas'] = event.oNovaPartida.oNovaPartida.lMesas.length;

        List<Map<String, dynamic>> alunos = new List<Map<String, dynamic>>();

        List<int> ids = new List<int>();

        event.oNovaPartida.oNovaPartida.lAlunos.forEach((a) {
          if (!ids.contains(a.nMesaId)) {
            ids.add(a.nMesaId);
          }
        });

        ids.sort();

        event.oNovaPartida.oNovaPartida.lAlunos.forEach((a) {
          Map<String, dynamic> aluno = new Map<String, dynamic>();
          aluno['mu_usuario_id'] = a.id;

          for (int i = 0; i < ids.length; i++) {
            if (a.nMesaId == ids[i]) {
              aluno['num_mesa'] = i;
              break;
            }
          }

          alunos.add(aluno);
        });

        dados['partida_alunos'] = alunos;

        String jsonDados = jsonEncode(dados);

        print (jsonDados);

        ServerResponse sr = await oConfirmacaoRepository.addPartida(dados: jsonDados);

        if (sr.success == 1) {

          Scaffold.of(Application.kHome.currentContext).hideCurrentSnackBar();
          Scaffold.of(Application.kHome.currentContext).showSnackBar(
            SnackBar(
              content: Text('Partida criada com sucesso'),
              backgroundColor: Colors.lightGreen,
            ),
          );



          Application.oRouter.pop(Application.kConfirmacao.currentContext);
          Application.kHome.currentState.forceUpdate();
        }
        else {
          Scaffold.of(Application.kConfirmacao.currentContext).hideCurrentSnackBar();
          Scaffold.of(Application.kConfirmacao.currentContext).showSnackBar(
            SnackBar(
              content: Text(sr.error.toUpperCase()),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
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