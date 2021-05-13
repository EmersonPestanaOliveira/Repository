import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Usuario.dart';
import 'package:meta/meta.dart';

import 'DadosCompetencia.dart';
import 'DadosUsuario.dart';

abstract class UsuarioState extends Equatable {
  UsuarioState([List props = const []]) : super(props);
}

class UsuarioUninitialized extends UsuarioState {
  @override
  String toString() => 'UsuarioUninitialized';
}

class UsuarioLoading extends UsuarioState {
  @override
  String toString() => 'UsuarioLoading';
}

class UsuarioInitialized extends UsuarioState {
  final Usuario oUsuario;

  UsuarioInitialized({@required this.oUsuario}) : super([oUsuario]);

  @override
  String toString() => 'UsuarioInitialized';
}

class UsuarioInitializedFinal extends UsuarioState {
  final List<DadosUsuario> oDetalhes;
  final List<DadosCompetencia> oInteligencias;
  final Usuario oUsuario;

  UsuarioInitializedFinal({@required this.oDetalhes, @required this.oInteligencias, @required this.oUsuario}) : super([oDetalhes,oInteligencias, oUsuario]);

  @override
  String toString() => 'UsuarioInitializedFinal';
}

class UsuarioEmpty extends UsuarioState {
  @override
  String toString() => 'UsuarioEmpty';
}

class UsuarioError extends UsuarioState {
  final String sError;

  UsuarioError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'UsuarioError { error: $sError }';
}