import 'package:equatable/equatable.dart';

abstract class BlogEvent extends Equatable {
  BlogEvent([List props = const []]) : super(props);
}

class BlogLoad extends BlogEvent {
  @override
  String toString() => 'BlogLoad';
}