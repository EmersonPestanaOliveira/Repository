import 'dart:async';

import 'package:ludo_academy/controller/repository/usuario/UsuarioRepository.dart';
import 'package:ludo_academy/model/database/Usuario.dart';
import 'package:ludo_academy/model/inteligencia/InteligenciaEvent.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:ludo_academy/model/user/DetalhesEvent.dart';
import 'package:ludo_academy/model/user/UsuarioEvent.dart';
import 'package:ludo_academy/model/user/UsuarioState.dart';
import 'package:ludo_academy/view/blocs/inteligencia/InteligenciaBloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'DetalhesBloc.dart';


class UserBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final UsuarioRepository oUsuarioRepository;
  final DetalhesBloc oBlocDetalhes;
  final InteligenciaBloc oBlocInteligencia;

  StreamSubscription oDetalhesSubscription;
  StreamSubscription oInteligenciaSubscription;

  UserBloc({
    @required this.oUsuarioRepository,
    @required this.oBlocDetalhes,
    @required this.oBlocInteligencia,
  })  : assert(UsuarioRepository != null) {

    oDetalhesSubscription = oBlocDetalhes.state.listen((state) {
      if (state.toString() == 'DetalhesInitialized') {

        oBlocInteligencia.dispatch(InteligenciaLoad());
      }
    });

    oInteligenciaSubscription = oBlocInteligencia.state.listen((state) {
      if (state.toString() == 'InteligenciaInitialized') {

        this.dispatch(UsuarioLoad2());
      }
    });

  }

  UsuarioState get initialState => UsuarioUninitialized();

  Usuario oUsuario;

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is UsuarioLoad) {
      yield UsuarioLoading();

      try {
        print ("usuario id: " + event.alunoId);
        ServerResponse r = await oUsuarioRepository.alunoLoader(usuario: event.alunoId);
        oUsuario = Usuario.fromJson(r.data[0]);

        oBlocDetalhes.dispatch(DetalhesLoad(oUsuario.id.toString()));

        yield UsuarioLoading();
        //yield UsuarioInitialized(oUsuario: oUsuario);
      }
      catch(error) {
        yield UsuarioError(sError: error.toString());
      }
    }
    if (event is UsuarioLoad2) {
      yield UsuarioInitializedFinal(oInteligencias: oBlocInteligencia.oInteligencias, oDetalhes: oBlocDetalhes.oDetalhes, oUsuario: oUsuario);
    }
  }

  @override
  void dispose() {
    oDetalhesSubscription.cancel();
    oInteligenciaSubscription.cancel();
    super.dispose();
  }
}