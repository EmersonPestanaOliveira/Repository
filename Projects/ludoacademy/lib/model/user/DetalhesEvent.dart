import 'package:equatable/equatable.dart';

abstract class DetalhesEvent extends Equatable {
  DetalhesEvent([List props = const []]) : super(props);
}

class DetalhesLoad extends DetalhesEvent {

  final String alunoId;

  DetalhesLoad(this.alunoId);

  @override
  String toString() => 'DetalhesLoad';
}