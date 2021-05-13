import 'dart:async';

import 'package:ludo_academy/controller/repository/usuario/DetalhesRepository.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:ludo_academy/model/user/DadosUsuario.dart';
import 'package:ludo_academy/model/user/DetalhesEvent.dart';
import 'package:ludo_academy/model/user/DetalhesState.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class DetalhesBloc extends Bloc<DetalhesEvent, DetalhesState> {
  final DetalhesRepository oDetalhesRepository;

  DetalhesBloc({
    @required this.oDetalhesRepository
  })  : assert(DetalhesRepository != null);

  DetalhesState get initialState => DetalhesUninitialized();

  List<DadosUsuario> _oDetalhes;

  // ignore: unnecessary_getters_setters
  List<DadosUsuario> get oDetalhes => _oDetalhes;
  // ignore: unnecessary_getters_setters
  set oDetalhes(List<DadosUsuario> oDetalhes) {
    _oDetalhes = oDetalhes;
  }

  @override
  Stream<DetalhesState> mapEventToState(DetalhesEvent event) async* {
    if (event is DetalhesLoad) {
      yield DetalhesLoading();

      try {
        ServerResponse r = await oDetalhesRepository.detalhesLoader(usuario: event.alunoId.toString());

        oDetalhes = new List<DadosUsuario>();

        if (r.data != null) {
          r.data.forEach((item) {
            oDetalhes.add(new DadosUsuario.fromJson(item));
          });
        }

        yield DetalhesInitialized(oDetalhes: oDetalhes);
      }
      catch(error) {
        yield DetalhesError(sError: error.toString());
      }
    }
  }
}