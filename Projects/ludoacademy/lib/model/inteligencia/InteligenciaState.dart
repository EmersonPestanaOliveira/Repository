import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/user/DadosCompetencia.dart';
import 'package:meta/meta.dart';

abstract class InteligenciaState extends Equatable {
  InteligenciaState([List props = const []]) : super(props);
}

class InteligenciaUninitialized extends InteligenciaState {
  @override
  String toString() => 'InteligenciaUninitialized';
}

class InteligenciaLoading extends InteligenciaState {
  @override
  String toString() => 'InteligenciaLoading';
}

class InteligenciaInitialized extends InteligenciaState {
  final List<DadosCompetencia> oInteligencias;

  InteligenciaInitialized({@required this.oInteligencias}) : super([oInteligencias]);

  @override
  String toString() => 'InteligenciaInitialized';
}

class InteligenciaEmpty extends InteligenciaState {
  @override
  String toString() => 'InteligenciaEmpty';
}

class InteligenciaError extends InteligenciaState {
  final String sError;

  InteligenciaError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'InteligenciaError { error: $sError }';
}