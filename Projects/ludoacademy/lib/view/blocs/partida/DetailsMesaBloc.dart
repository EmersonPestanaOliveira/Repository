import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/repository/partida/DetailsMesaRepository.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/MesaUsuario.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:ludo_academy/model/partida/DetailsMesaEvent.dart';
import 'package:ludo_academy/model/partida/DetailsMesaState.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class DetailsMesaBloc extends Bloc<DetailsMesaEvent,DetailsMesaState> {
  final DetailsMesaRepository oDetailsMesaRepository;

  DetailsMesaBloc({
    @required this.oDetailsMesaRepository
  })  : assert(DetailsMesaRepository != null);

  DetailsMesaState get initialState => DetailsMesaUninitialized();

  @override
  Stream<DetailsMesaState> mapEventToState(DetailsMesaEvent event) async* {
    yield DetailsMesaLoading();

    if (event is DetailsMesaLoad) {
      try {
        ServerResponse p = await oDetailsMesaRepository.partidaLoader(partidaId: event.nPartidaId);

        // print(s.data[0]);

        Partida oPartida = Partida.fromJson(p.data[0]);

        ServerResponse s = await oDetailsMesaRepository.mesaLoader(mesaId: event.nMesaId);

        // print(s.data[0]);

        Mesa oMesa = Mesa.fromJson(s.data[0]);

        ServerResponse s2 = await oDetailsMesaRepository.alunosLoader(mesaId: event.nMesaId);

        List<MesaUsuario> oAlunos = new List<MesaUsuario>();

        s2.data.forEach((item) {
          oAlunos.add(new MesaUsuario.fromJson(item));
        });

        yield DetailsMesaInitialized(oAlunos: oAlunos, oMesa: oMesa, oPartida: oPartida);
      }
      catch(error) {
        yield DetailsMesaError(sError: error.toString());
      }
    }

    if (event is DetailsFecharMesa) {
      yield DetailsMesaLoading();

      try {
        Map<String, dynamic> dados = new Map<String, dynamic>();

        dados['partida_id'] = event.oPartida.id;
        dados['jogo_id'] = event.oPartida.jogoId;
        dados['mesa_id'] = event.oMesa.id;

        List<int> alunosIds = new List<int>();

        event.oAlunos.forEach((aluno) {
          alunosIds.add(aluno.usuarioId);
        });

        dados['alunos_ids'] = alunosIds;

        String jsonDados = jsonEncode(dados);

        print (jsonDados);

        ServerResponse sr = await oDetailsMesaRepository.fecharMesa(dados: jsonDados);



        if (sr.success == 1) {
          /*Scaffold.of(Application.kDetailsMesa.currentContext).hideCurrentSnackBar();
          Scaffold.of(Application.kDetailsMesa.currentContext).showSnackBar(
            SnackBar(
              content: Text('Mesa fechada com sucesso'),
              backgroundColor: Colors.lightGreen,
            ),
          );
          */
          print ("sucesso");
        }
        else {
          /*
          Scaffold.of(Application.kDetailsMesa.currentContext).hideCurrentSnackBar();
          Scaffold.of(Application.kDetailsMesa.currentContext).showSnackBar(
            SnackBar(
              content: Text(sr.error.toUpperCase()),
              backgroundColor: Colors.redAccent,
            ),
          );
          */
          print ("erro");
        }

        
        this.dispatch(DetailsMesaLoad(event.oMesa.id, event.oPartida.id));
      }
      catch (error) {
        yield DetailsMesaError(sError: error.toString());
      }




    }
  }
}