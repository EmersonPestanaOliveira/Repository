import 'dart:async';

import 'package:ludo_academy/model/database/Partida.dart';
import 'package:ludo_academy/model/home/historico/HistoricoEvent.dart';
import 'package:ludo_academy/model/home/historico/HistoricoState.dart';
import 'package:ludo_academy/controller/repository/home/historico/HistoricoRepository.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';


class HistoricoBloc extends Bloc<HistoricoEvent, HistoricoState> {
  final HistoricoRepository oHistoricoRepository;

  HistoricoBloc({
    @required this.oHistoricoRepository
  })  : assert(HistoricoRepository != null);

  HistoricoState get initialState => HistoricoUninitialized();

  @override
  Stream<HistoricoState> mapEventToState(HistoricoEvent event) async* {
    if (event is HistoricoLoad) {
      yield HistoricoLoading();
          
      try { 
        ServerResponse r = await oHistoricoRepository.partidaLoader(usuario: Application.oProfile.usuarioId.toString(),
                                                                    escola: Application.oProfile.escolaId);
        List<Partida> oPartidas = new List<Partida>();

        Application.lPartidas.clear();

        if (r.data != null && r.data.length > 0) {
          r.data.forEach((item) {
            Partida p = new Partida.fromJson(item);

            if (p.status == 1) {
              Application.lPartidas.add (p.turmaId);
            }

            oPartidas.add(p);
          });
        }

        if (oPartidas.length > 0) {
          yield HistoricoInitialized(oPartidas: oPartidas);
        }
        else {
          yield HistoricoEmpty();
        }
      }
      catch(error) {
        yield HistoricoError(sError: error);
      }
    }
    if (event is HistoricoInit) {
      yield HistoricoUninitialized();

      this.dispatch(HistoricoLoad());
    }
  }
}