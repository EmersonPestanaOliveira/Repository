import 'dart:async';

import 'package:ludo_academy/controller/repository/home/jogos/JogosRepository.dart';
import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:ludo_academy/model/home/jogos/JogosState.dart';
import 'package:ludo_academy/model/home/jogos/JogosEvent.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class JogosBloc extends Bloc<JogosEvent, JogosState> {
  final JogosRepository oJogosRepository;

  JogosBloc({
    @required this.oJogosRepository
  })  : assert(JogosRepository != null);

  JogosState get initialState => JogosUninitialized();

  @override
  Stream<JogosState> mapEventToState(JogosEvent event) async* {
    if (event is JogosLoad) {
      yield JogosLoading();

      try {
        ServerResponse r = await oJogosRepository.jogosLoader(event.escolaId);
        List<Jogo> oJogos = new List<Jogo>();

        if (r.data != null && r.data.length > 0) {
          r.data.forEach((item) {
            oJogos.add(new Jogo.fromJson(item));
          });
        }

        if (oJogos.length > 0) {
          yield JogosInitialized(oJogos: oJogos);
        }
        else {
          yield JogosEmpty();
        }
      }
      catch(error) {
        yield JogosError(sError: error);
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