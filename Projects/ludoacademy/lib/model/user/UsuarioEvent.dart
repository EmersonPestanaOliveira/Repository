import 'package:equatable/equatable.dart';

abstract class UsuarioEvent extends Equatable {
  UsuarioEvent([List props = const []]) : super(props);
}

class UsuarioLoad extends UsuarioEvent {

  final String alunoId;

  UsuarioLoad(this.alunoId);

  @override
  String toString() => 'UsuarioLoad';
}

class UsuarioLoad2 extends UsuarioEvent {
  @override
  String toString() => 'UsuarioLoad2';
}