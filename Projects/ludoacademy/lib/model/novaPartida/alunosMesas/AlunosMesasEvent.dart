import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';

abstract class AlunosMesasEvent extends Equatable {
  AlunosMesasEvent([List props = const []]) : super(props);
}

class AlunosMesasLoad extends AlunosMesasEvent {

  final List<AlunoPresenca> oAlunos;
  final Jogo oJogo;
  final NovaPartidaBloc oNovaPartidaBloc;

  AlunosMesasLoad(this.oAlunos, this.oJogo, this.oNovaPartidaBloc);

  @override
  String toString() => 'AlunosMesasLoad';
}