import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/help/PartidaHelper.dart';
import 'package:ludo_academy/controller/repository/novaPartida/alunosMesas/AlunosMesasRepository.dart';
import 'package:ludo_academy/model/novaPartida/alunosMesas/AlunosMesasEvent.dart';
import 'package:ludo_academy/model/novaPartida/alunosMesas/AlunosMesasState.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesaJogo.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import '../NovaPartidaBloc.dart';


class AlunosMesasBloc extends Bloc<AlunosMesasEvent, AlunosMesasState> {
  final AlunosMesasRepository oAlunosMesasRepository;

  AlunosMesasBloc({
    @required this.oAlunosMesasRepository,
  })  : assert(AlunosMesasRepository
      != null);

  AlunosMesasState get initialState => AlunosMesasUninitialized();


  @override
  Stream<AlunosMesasState> mapEventToState(AlunosMesasEvent event) async* {
    if (event is AlunosMesasLoad) {
      yield AlunosMesasLoading();

      try {

        NovaPartidaBloc oNovaPartida = event.oNovaPartidaBloc;

        if (!oNovaPartida.oNovaPartida.bMesasArranged) {
          oNovaPartida.oNovaPartida.bMesasArranged = true;
          List<MesaJogo> oMesas = PartidaHelper.doMesasRandom(oNovaPartida.oNovaPartida.lAlunos, oNovaPartida.oNovaPartida.oJogo);
          oNovaPartida.oNovaPartida.lMesas = oMesas;

          // todo sistema suiço

          print ("GERADOR DE MESAS");

          print ("mesas length: " + oMesas.length.toString() + ", alunos length: " + oNovaPartida.oNovaPartida.lAlunos.length.toString());


          int index = 0;
          for (int j = 0; j < oMesas.length; j++) {

            print ("qtd players da mesa " + oMesas[j].nId.toString() + ": " + oMesas[j].nPlayers.toString());

            for (int k = 0; k < oMesas[j].nPlayers; k++) {

              oNovaPartida.oNovaPartida.addAlunoToMesa(oNovaPartida.oNovaPartida.lAlunos[index].id, oMesas[j].nId);

              index++;
            }
          }
        }

        yield AlunosMesasInitialized(oAlunos: oNovaPartida.oNovaPartida.lAlunos);


        await new Future.delayed(const Duration(seconds: 1));
        Application.kTab.currentState.oTabController.animateTo(Application.kTab.currentState.oTabController.index+1);



      }
      catch (error) {
        yield AlunosMesasError(sError: error.toString());
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