import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';
import 'package:meta/meta.dart';

abstract class AlunosState extends Equatable {
  AlunosState([List props = const []]) : super(props);
}

class AlunosUninitialized extends AlunosState {
  @override
  String toString() => 'AlunosUninitialized';
}

class AlunosLoading extends AlunosState {
  @override
  String toString() => 'AlunosLoading';
}

class AlunosInitialized extends AlunosState {
  final List<AlunoPresenca> oAlunos;

  AlunosInitialized({@required this.oAlunos}) : super([oAlunos]);

  @override
  String toString() => 'AlunosInitialized';
}

class AlunosEmpty extends AlunosState {
  @override
  String toString() => 'AlunosEmpty';
}

class AlunosError extends AlunosState {
  final String sError;

  AlunosError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'AlunosError { error: $sError }';
}