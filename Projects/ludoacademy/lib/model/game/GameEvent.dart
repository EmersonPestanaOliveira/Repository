import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class GameEvent extends Equatable {
  GameEvent([List props = const []]) : super(props);
}

class GameEventLoad extends GameEvent {

  final int jogoId;

  GameEventLoad(this.jogoId);

  @override
  String toString() => 'GameEventLoad';
}

class SaveSolicitacao extends GameEvent {

  final int escolaId;
  final int usuarioId;
  final int jogoId;

  SaveSolicitacao({@required this.escolaId,
    @required this.usuarioId,
    @required this.jogoId}) : super([escolaId, usuarioId, jogoId]);

  @override
  String toString() => 'JogosLoad';
}
