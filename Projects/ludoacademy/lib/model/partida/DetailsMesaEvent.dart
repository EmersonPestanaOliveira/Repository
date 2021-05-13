import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/model/database/Mesa.dart';
import 'package:ludo_academy/model/database/MesaUsuario.dart';
import 'package:ludo_academy/model/database/Partida.dart';

abstract class DetailsMesaEvent extends Equatable {
  DetailsMesaEvent([List props = const []]) : super(props);
}

class DetailsMesaLoad extends DetailsMesaEvent {

  final int nMesaId;
  final int nPartidaId;

  DetailsMesaLoad(this.nMesaId, this.nPartidaId);

  @override
  String toString() => 'DetailsMesaLoad';
}

class DetailsFecharMesa extends DetailsMesaEvent {

  final List<MesaUsuario> oAlunos;
  final Mesa oMesa;
  final Partida oPartida;
  final BuildContext oContext;

  DetailsFecharMesa(this.oAlunos, this.oMesa, this.oPartida, this.oContext);

  @override
  String toString() => 'DetailsFecharMesa';
}