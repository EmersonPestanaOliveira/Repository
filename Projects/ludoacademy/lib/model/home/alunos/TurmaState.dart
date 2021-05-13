import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Turma.dart';
import 'package:meta/meta.dart';

abstract class TurmaState extends Equatable {
  TurmaState([List props = const []]) : super(props);
}

class TurmaUninitialized extends TurmaState {
  @override
  String toString() => 'TurmaUninitialized';
}

class TurmaLoading extends TurmaState {
  @override
  String toString() => 'TurmaLoading';
}

class TurmaInitialized extends TurmaState {
  final List<Turma> oTurmas;

  TurmaInitialized({@required this.oTurmas}) : super([oTurmas]);

  @override
  String toString() => 'TurmaInitialized';
}

class TurmaEmpty extends TurmaState {
  @override
  String toString() => 'AlunosEmpty';
}

class TurmaError extends TurmaState {
  final String sError;

  TurmaError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'TurmaError { error: $sError }';
}

class TurmaSelected extends TurmaState {
  final String sTurmaSelected;

  TurmaSelected({@required this.sTurmaSelected}) : super([sTurmaSelected]);

  @override
  String toString() => 'TurmaSelected';
}