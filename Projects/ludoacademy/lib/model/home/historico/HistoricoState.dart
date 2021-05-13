import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:meta/meta.dart';

abstract class HistoricoState extends Equatable {
  HistoricoState([List props = const []]) : super(props);
}

class HistoricoUninitialized extends HistoricoState {
  @override
  String toString() => 'HistoricoUninitialized';
}

class HistoricoLoading extends HistoricoState {
  @override
  String toString() => 'HistoricoLoading';
}

class HistoricoInitialized extends HistoricoState {
  final List<Partida> oPartidas;

  HistoricoInitialized({@required this.oPartidas}) : super([oPartidas]);

  @override
  String toString() => 'HistoricoInitialized';
}

class HistoricoEmpty extends HistoricoState {
  @override
  String toString() => 'HistoricoEmpty';
}

class HistoricoError extends HistoricoState {
  final String sError;

  HistoricoError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'HistoricoError { error: $sError }';
}