import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';
import 'package:meta/meta.dart';

abstract class AlunosMesasState extends Equatable {
  AlunosMesasState([List props = const []]) : super(props);
}

class AlunosMesasUninitialized extends AlunosMesasState {
  @override
  String toString() => 'AlunosMesasUninitialized';
}

class AlunosMesasLoading extends AlunosMesasState {
  @override
  String toString() => 'AlunosMesasLoading';
}

class AlunosMesasEmpty extends AlunosMesasState {
  @override
  String toString() => 'AlunosMesasEmpty';
}

class AlunosMesasInitialized extends AlunosMesasState {
  final List<AlunoPresenca> oAlunos;

  AlunosMesasInitialized({@required this.oAlunos}) : super([oAlunos]);

  @override
  String toString() => 'AlunosMesasInitialized';
}

class AlunosMesasError extends AlunosMesasState {
  final String sError;

  AlunosMesasError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'AlunosMesasError { error: $sError }';
}