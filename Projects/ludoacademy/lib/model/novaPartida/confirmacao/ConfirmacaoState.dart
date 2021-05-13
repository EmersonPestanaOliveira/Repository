import 'package:equatable/equatable.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';
import 'package:meta/meta.dart';

abstract class ConfirmacaoState extends Equatable {
  ConfirmacaoState([List props = const []]) : super(props);
}

class ConfirmacaoUninitialized extends ConfirmacaoState {
  @override
  String toString() => 'ConfirmacaoUninitialized';
}

class ConfirmacaoInitialized extends ConfirmacaoState {

  final NovaPartidaBloc oNovaPartidaBloc;

  ConfirmacaoInitialized({@required this.oNovaPartidaBloc}) : super([oNovaPartidaBloc]);

  @override
  String toString() => 'ConfirmacaoInitialized';
}

class ConfirmacaoLoading extends ConfirmacaoState {
  @override
  String toString() => 'ConfirmacaoLoading';
}

class ConfirmacaoEmpty extends ConfirmacaoState {
  @override
  String toString() => 'ConfirmacaoEmpty';
}

class ConfirmacaoReturn extends ConfirmacaoState {
  final int nId;

  ConfirmacaoReturn({@required this.nId}) : super([nId]);

  @override
  String toString() => 'ConfirmacaoReturn';
}

class ConfirmacaoError extends ConfirmacaoState {
  final String sError;

  ConfirmacaoError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'ConfirmacaoError { error: $sError }';
}