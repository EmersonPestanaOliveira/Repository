import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:meta/meta.dart';

abstract class DetailsPartidaState extends Equatable {
  DetailsPartidaState([List props = const []]) : super(props);
}

class DetailsPartidaUninitialized extends DetailsPartidaState {
  @override
  String toString() => 'DetailsPartidaUninitialized';
}

class DetailsPartidaLoading extends DetailsPartidaState {
  @override
  String toString() => 'DetailsPartidaLoading';
}

class DetailsPartidaEmpty extends DetailsPartidaState {
  @override
  String toString() => 'DetailsPartidaEmpty';
}

class DetailsPartidaInitialized extends DetailsPartidaState {
  final Partida oPartida;
  final List<Mesa> oMesas;

  DetailsPartidaInitialized({@required this.oMesas, @required this.oPartida}) : super([oMesas, oPartida]);

  @override
  String toString() => 'DetailsPartidaInitialized';
}

class DetailsPartidaError extends DetailsPartidaState {
  final String sError;

  DetailsPartidaError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'DetailsPartidaError { error: $sError }';
}