import 'package:equatable/equatable.dart';

abstract class ChangeSchoolEvent extends Equatable {
  ChangeSchoolEvent([List props = const []]) : super(props);
}

class ChangeSchoolLoad extends ChangeSchoolEvent {

  final int id;

  ChangeSchoolLoad(this.id);

  @override
  String toString() => 'ChangeSchoolLoad';
}