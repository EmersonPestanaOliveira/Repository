import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';
import 'package:meta/meta.dart';

abstract class ConfirmacaoEvent extends Equatable {
  ConfirmacaoEvent([List props = const []]) : super(props);
}

class ConfirmacaoLoad extends ConfirmacaoEvent {

  final NovaPartidaBloc oNovaPartida;

  ConfirmacaoLoad({@required this.oNovaPartida}) : super([oNovaPartida]);

  @override
  String toString() => 'ConfirmacaoLoad';
}

class AddPartida extends ConfirmacaoEvent {

  final NovaPartidaBloc oNovaPartida;
  final BuildContext context;

  AddPartida({@required this.oNovaPartida, @required this.context}) : super([oNovaPartida,context]);

  @override
  String toString() => 'AddPartida';
}