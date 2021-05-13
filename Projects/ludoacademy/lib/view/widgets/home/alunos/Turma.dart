import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/home/alunos/TurmaEvent.dart';
import 'package:ludo_academy/model/home/alunos/TurmaState.dart';
import 'package:ludo_academy/view/blocs/home/TurmaBloc.dart';

import '../../DefaultLoading.dart';
import 'AlunosTurmaSelect.dart';

class Turma extends StatefulWidget {
  @override
  State createState() {
    return new TurmaWidgetState();
  }
}

class TurmaWidgetState extends State<Turma> {
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
              child: BlocBuilder<TurmaEvent, TurmaState>(
                bloc: BlocProvider.of<TurmaBloc>(context),
                builder: (BuildContext context, TurmaState state) {
                  if (state is TurmaUninitialized) {
                    return DefaultLoading();
                  }
                  if (state is TurmaLoading) {
                    return DefaultLoading();
                  }
                  if (state is TurmaEmpty) {
                    return Text("VAZIO");
                  }
                  if (state is TurmaInitialized) {
                    return AlunosTurmaSelect(sDefaultValue: BlocProvider.of<TurmaBloc>(context).sDefaultValue, oTurmas: state.oTurmas);
                  }
                  if (state is TurmaSelected) {
                    return DefaultLoading();
                  }

                },
              ),
            )
        )
    );
  }
}

