import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/Partida.dart';

abstract class DetailsPartidaEvent extends Equatable {
  DetailsPartidaEvent([List props = const []]) : super(props);
}

class DetailsPartidaReset extends DetailsPartidaEvent {

  final int nPartidaId;

  DetailsPartidaReset(this.nPartidaId);

  @override
  String toString() => 'DetailsPartidaReset';
}

class DetailsPartidaLoad extends DetailsPartidaEvent {

  final int nPartidaId;

  DetailsPartidaLoad(this.nPartidaId);

  @override
  String toString() => 'DetailsPartidaLoad';
}

class DetailsPartidaFechar extends DetailsPartidaEvent {

  final List<Mesa> oMesas;
  final Partida oPartida;
  final BuildContext oContext;

  DetailsPartidaFechar(this.oMesas, this.oPartida, this.oContext);

  @override
  String toString() => 'DetailsPartidaFechar';
}