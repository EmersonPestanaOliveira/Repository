import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'DadosUsuario.dart';

abstract class DetalhesState extends Equatable {
  DetalhesState([List props = const []]) : super(props);
}

class DetalhesUninitialized extends DetalhesState {
  @override
  String toString() => 'UsuarioUninitialized';
}

class DetalhesLoading extends DetalhesState {
  @override
  String toString() => 'DetalhesLoading';
}

class DetalhesInitialized extends DetalhesState {
  final List<DadosUsuario> oDetalhes;

  DetalhesInitialized({@required this.oDetalhes}) : super([oDetalhes]);

  @override
  String toString() => 'DetalhesInitialized';
}

class DetalhesEmpty extends DetalhesState {
  @override
  String toString() => 'DetalhesEmpty';
}

class DetalhesError extends DetalhesState {
  final String sError;

  DetalhesError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'DetalhesError { error: $sError }';
}