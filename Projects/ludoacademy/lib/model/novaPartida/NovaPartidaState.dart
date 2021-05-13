import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class NovaPartidaState extends Equatable {
  NovaPartidaState([List props = const []]) : super(props);
}

class NovaPartidaJogos extends NovaPartidaState {
  @override
  String toString() => 'NovaPartidaJogos';
}

class NovaPartidaTurma extends NovaPartidaState {
  @override
  String toString() => 'NovaPartidaTurma';
}

class NovaPartidaAlunos extends NovaPartidaState {
  @override
  String toString() => 'NovaPartidaAlunos';
}

class NovaPartidaMesas extends NovaPartidaState {
  @override
  String toString() => 'NovaPartidaMesas';
}

class NovaPartidaConfirmacao extends NovaPartidaState {
  @override
  String toString() => 'NovaPartidaConfirmacao';
}

class NovaPartidaLoading extends NovaPartidaState {
  @override
  String toString() => 'NovaPartidaLoading';
}

class NovaPartidaEmpty extends NovaPartidaState {
  @override
  String toString() => 'NovaPartidaEmpty';
}

class NovaPartidaError extends NovaPartidaState {
  final String sError;

  NovaPartidaError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'NovaPartidaError { error: $sError }';
}