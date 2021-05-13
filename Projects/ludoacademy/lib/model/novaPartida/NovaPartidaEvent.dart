import 'package:equatable/equatable.dart';

abstract class NovaPartidaEvent extends Equatable {
  NovaPartidaEvent([List props = const []]) : super(props);
}

class NovaPartidaJogosLoad extends NovaPartidaEvent {

  @override
  String toString() => 'NovaPartidaJogosLoad';
}

class NovaPartidaTurmaLoad extends NovaPartidaEvent {

  @override
  String toString() => 'NovaPartidaTurmaLoad';
}

class NovaPartidaTurmaBackLoad extends NovaPartidaEvent {

  @override
  String toString() => 'NovaPartidaTurmaBackLoad';
}

class NovaPartidaAlunosLoad extends NovaPartidaEvent {

  @override
  String toString() => 'NovaPartidaAlunosLoad';
}

class NovaPartidaMesasLoad extends NovaPartidaEvent {

  @override
  String toString() => 'NovaPartidaMesasLoad';
}

class NovaPartidaConfirmacaoLoad extends NovaPartidaEvent {

  @override
  String toString() => 'NovaPartidaConfirmacaoLoad';
}