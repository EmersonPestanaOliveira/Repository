import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/model/room/AlunoPresenca.dart';
import 'package:meta/meta.dart';

abstract class PresencaEvent extends Equatable {
  PresencaEvent([List props = const []]) : super(props);
}

class PresencaAdd extends PresencaEvent {

  final AlunoPresenca oAluno;
  final BuildContext context;

  PresencaAdd({@required this.oAluno, @required this.context}) : super([oAluno,context]);

  @override
  String toString() => 'PresencaAdd';
}