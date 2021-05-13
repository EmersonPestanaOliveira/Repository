import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Escola.dart';
import 'package:meta/meta.dart';

abstract class ChangeSchoolState extends Equatable {
  ChangeSchoolState([List props = const []]) : super(props);
}

class ChangeSchoolUninitialized extends ChangeSchoolState {
  @override
  String toString() => 'ChangeSchoolUninitialized';
}

class ChangeSchoolLoading extends ChangeSchoolState {
  @override
  String toString() => 'ChangeSchoolLoading';
}

class ChangeSchoolEmpty extends ChangeSchoolState {
  @override
  String toString() => 'ChangeSchoolEmpty';
}

class ChangeSchoolInitialized extends ChangeSchoolState {

  final List<Escola> oEscolas;

  ChangeSchoolInitialized({@required this.oEscolas}) : super([oEscolas]);

  @override
  String toString() => 'ChangeSchoolInitialized';
}

class ChangeSchoolError extends ChangeSchoolState {
  final String sError;

  ChangeSchoolError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'ChangeSchoolError { error: $sError }';
}