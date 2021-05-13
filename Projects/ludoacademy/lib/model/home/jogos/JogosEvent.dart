import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class JogosEvent extends Equatable {
  JogosEvent([List props = const []]) : super(props);
}

class JogosLoad extends JogosEvent {

  final int escolaId;

  JogosLoad({@required this.escolaId}) : super([escolaId]);

  @override
  String toString() => 'JogosLoad';
}