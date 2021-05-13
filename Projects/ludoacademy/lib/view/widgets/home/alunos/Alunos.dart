import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/home/alunos/AlunosEvent.dart';
import 'package:ludo_academy/model/home/alunos/AlunosState.dart';
import 'package:ludo_academy/view/blocs/home/AlunosBloc.dart';

import '../../DefaultError.dart';
import '../../DefaultLoading.dart';
import 'AlunosList.dart';
import 'AlunosListEmpty.dart';

class Alunos extends StatefulWidget {

  @override
  State createState() {
    return new AlunosWidgetState();
  }
}

class AlunosWidgetState extends State<Alunos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SafeArea(
          top: false,
          bottom: false,
          child: Container (
            color: new Color(0xFFf1f1f1),
            child: BlocBuilder<AlunosEvent, AlunosState>(
              bloc: BlocProvider.of<AlunosBloc>(context),
              builder: (BuildContext context, AlunosState state) {
                if (state is AlunosUninitialized) {
                  return AlunosListEmpty();
                }
                if (state is AlunosLoading) {
                  return DefaultLoading();
                }
                if (state is AlunosEmpty) {
                  return AlunosListEmpty();
                }
                if (state is AlunosInitialized) {
                  return AlunosList(oAlunos: state.oAlunos);
                }
                if (state is AlunosError) {
                  return DefaultError(sError: state.sError,);
                }
              },
            ),
          )
        )
    );
  }
}

