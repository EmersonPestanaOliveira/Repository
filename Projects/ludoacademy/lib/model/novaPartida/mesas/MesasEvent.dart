import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';
import 'package:meta/meta.dart';

abstract class MesasEvent extends Equatable {
  MesasEvent([List props = const []]) : super(props);
}

class MesasGeneratorLoad extends MesasEvent {

  final NovaPartidaBloc oNovaPartidaBloc;

  MesasGeneratorLoad(this.oNovaPartidaBloc);

  @override
  String toString() => 'MesasGeneratorLoad';
}

class MesasNovaPartidaLoad extends MesasEvent {

  MesasNovaPartidaLoad();

  @override
  String toString() => 'MesasNovaPartidaLoad';
}

class MesaAdd extends MesasEvent {

  final int nId;
  final int nAlunoId;
  final BuildContext context;

  MesaAdd({@required this.nId, @required this.nAlunoId, @required this.context}) : super([nId,nAlunoId,context]);

  @override
  String toString() => 'MesaAdd';
}

class MesaRemove extends MesasEvent {

  final int nId;
  final int nAlunoId;
  final BuildContext context;

  MesaRemove({@required this.nId, @required this.nAlunoId, @required this.context}) : super([nId,nAlunoId,context]);

  @override
  String toString() => 'MesaRemove';
}

class MesaClear extends MesasEvent {

  final int nId;
  final BuildContext context;

  MesaClear({@required this.nId, @required this.context}) : super([nId,context]);

  @override
  String toString() => 'MesaClear';
}

