import 'package:equatable/equatable.dart';

abstract class InteligenciaEvent extends Equatable {
  InteligenciaEvent([List props = const []]) : super(props);
}

class InteligenciaLoad extends InteligenciaEvent {

  InteligenciaLoad();

  @override
  String toString() => 'InteligenciaLoad';
}