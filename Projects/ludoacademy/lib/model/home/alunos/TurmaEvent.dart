import 'package:equatable/equatable.dart';

abstract class TurmaEvent extends Equatable {
  TurmaEvent([List props = const []]) : super(props);
}

class TurmaLoad extends TurmaEvent {
  @override
  String toString() => 'TurmaLoad';
}

class TurmaSelect extends TurmaEvent {

  final String turmaSelected;
  final String nomeSelected;

  TurmaSelect(this.turmaSelected, this.nomeSelected);

  @override
  String toString() => 'TurmaSelect';
}