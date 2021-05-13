import 'package:equatable/equatable.dart';

abstract class HistoricoEvent extends Equatable {
  HistoricoEvent([List props = const []]) : super(props);
}

class HistoricoLoad extends HistoricoEvent {
  @override
  String toString() => 'HistoricoLoad';
}

class HistoricoInit extends HistoricoEvent {
  @override
  String toString() => 'HistoricoInit';
}