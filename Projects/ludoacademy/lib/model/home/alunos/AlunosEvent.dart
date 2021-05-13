import 'package:equatable/equatable.dart';

abstract class AlunosEvent extends Equatable {
  AlunosEvent([List props = const []]) : super(props);
}

class AlunosLoad extends AlunosEvent {

  final bool bUpdatePresenca;

  AlunosLoad(this.bUpdatePresenca);

  @override
  String toString() => 'AlunosLoad';
}