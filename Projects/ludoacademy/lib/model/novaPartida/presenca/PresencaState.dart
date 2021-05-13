import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PresencaState extends Equatable {
  PresencaState([List props = const []]) : super(props);
}

class PresencaUninitialized extends PresencaState {
  @override
  String toString() => 'PresencaUninitialized';
}

class PresencaLoading extends PresencaState {
  @override
  String toString() => 'PresencaLoading';
}

class PresencaEmpty extends PresencaState {
  @override
  String toString() => 'PresencaEmpty';
}

class PresencaReturn extends PresencaState {
  final int nId;

  PresencaReturn({@required this.nId}) : super([nId]);

  @override
  String toString() => 'PresencaReturn';
}

class PresencaError extends PresencaState {
  final String sError;

  PresencaError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'PresencaError { error: $sError }';
}