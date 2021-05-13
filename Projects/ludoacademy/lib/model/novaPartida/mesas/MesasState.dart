import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class MesasState extends Equatable {
  MesasState([List props = const []]) : super(props);
}

class MesasUninitialized extends MesasState {
  @override
  String toString() => 'MesasUninitialized';
}

class MesasGenerating extends MesasState {
  @override
  String toString() => 'MesasGenerating';
}

class MesasInitialized extends MesasState {
  @override
  String toString() => 'MesasInitialized';
}

class MesasLoading extends MesasState {
  @override
  String toString() => 'MesasLoading';
}

class MesasEmpty extends MesasState {
  @override
  String toString() => 'MesasEmpty';
}

class MesasReturn extends MesasState {
  final int nId;

  MesasReturn({@required this.nId}) : super([nId]);

  @override
  String toString() => 'MesasReturn';
}

class MesasError extends MesasState {
  final String sError;

  MesasError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'MesasError { error: $sError }';
}