import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:meta/meta.dart';

abstract class GameState extends Equatable {
  GameState([List props = const []]) : super(props);
}

class GameUninitialized extends GameState {
  @override
  String toString() => 'GameUninitialized';
}

class GameLoading extends GameState {
  @override
  String toString() => 'GameLoading';
}

class GameEmpty extends GameState {
  @override
  String toString() => 'GameEmpty';
}

class GameInitialized extends GameState {
  final Jogo oJogo;

  GameInitialized({@required this.oJogo}) : super([oJogo]);

  @override
  String toString() => 'GameInitialized';
}

class GameError extends GameState {
  final String sError;

  GameError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'GameError { error: $sError }';
}