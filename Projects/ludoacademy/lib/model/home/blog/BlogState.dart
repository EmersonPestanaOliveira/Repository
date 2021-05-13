import 'package:equatable/equatable.dart';
import 'package:ludo_academy/model/blog/BlogPost.dart';
import 'package:meta/meta.dart';

abstract class BlogState extends Equatable {
  BlogState([List props = const []]) : super(props);
}

class BlogUninitialized extends BlogState {
  @override
  String toString() => 'BlogUninitialized';
}

class BlogLoading extends BlogState {
  @override
  String toString() => 'BlogLoading';
}

class BlogInitialized extends BlogState {
  final List<BlogPost> oPosts;

  BlogInitialized({@required this.oPosts}) : super([oPosts]);

  @override
  String toString() => 'BlogInitialized';
}

class BlogEmpty extends BlogState {
  @override
  String toString() => 'BlogEmpty';
}

class BlogError extends BlogState {
  final String sError;

  BlogError({@required this.sError}) : super([sError]);

  @override
  String toString() => 'BlogError { error: $sError }';
}