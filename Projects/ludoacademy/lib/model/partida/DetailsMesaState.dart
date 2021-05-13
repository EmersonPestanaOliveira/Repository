import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/MesaUsuario.dart';
import 'package:ludo_academy/model/database/Partida.dart';
import 'package:meta/meta.dart';

abstract class DetailsMesaState extends Equatable {
  DetailsMesaState([List props = const []]) : super(props);
}

class DetailsMesaUninitialized extends DetailsMesaState {
  @override
  String toString() => 'DetailsMesaUninitialized';
}

class DetailsMesaLoading extends DetailsMesaState {
  @override
  String toString() => 'DetailsMesaLoading';
}

class DetailsMesaEmpty extends DetailsMesaState {
  @override
  String toString() => 'DetailsMesaEmpty';
}

class DetailsMesaInitialized extends DetailsMesaState {
  final List<MesaUsuario> oAlunos;
  final Mesa oMesa;
  final Partida oPartida;

  DetailsMesaInitialized({@required this.oAlunos, @required this.oMesa, @required this.oPartida}) : super([oAlunos, oMesa, oPartida]);

  @override
  String toString() => 'DetailsMesaInitialized';
}

class DetailsMesaError extends DetailsMesaState {
  final String sError;

  DetailsMesaError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'DetailsMesaError { error: $sError }';
}