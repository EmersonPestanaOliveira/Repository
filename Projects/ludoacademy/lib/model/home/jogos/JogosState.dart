import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:meta/meta.dart';

abstract class JogosState extends Equatable {
  JogosState([List props = const []]) : super(props);
}

class JogosUninitialized extends JogosState {
  @override
  String toString() => 'JogosUninitialized';
}

class JogosLoading extends JogosState {
  @override
  String toString() => 'JogosLoading';
}


class JogosInitialized extends JogosState {
  final List<Jogo> oJogos;

  JogosInitialized({@required this.oJogos}) : super([oJogos]);

  @override
  String toString() => 'JogosInitialized';
}

class JogosEmpty extends JogosState {
  @override
  String toString() => 'JogosEmpty';
}

class JogosError extends JogosState {
  final String sError;

  JogosError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'TurmaError { error: $sError }';
}