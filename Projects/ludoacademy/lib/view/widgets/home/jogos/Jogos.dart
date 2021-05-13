import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/home/jogos/JogosEvent.dart';
import 'package:ludo_academy/model/home/jogos/JogosState.dart';
import 'package:ludo_academy/view/blocs/home/JogosBloc.dart';

import '../../DefaultError.dart';
import '../../DefaultLoading.dart';
import 'JogosList.dart';
import 'JogosListEmpty.dart';

class Jogos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            SafeArea(
              top: false,
              bottom: false,
              child: Container(
                color: new Color(0xFFf1f1f1),
                child: BlocBuilder<JogosEvent, JogosState>(
                  bloc: BlocProvider.of<JogosBloc>(context),
                  builder: (BuildContext context, JogosState state) {
                    if (state is JogosUninitialized) {
                      return DefaultLoading();
                    }
                    if (state is JogosLoading) {
                      return DefaultLoading();
                    }
                    if (state is JogosEmpty) {
                      return JogosListEmpty();
                    }
                    if (state is JogosInitialized) {
                      return JogosList(items: state.oJogos);
                    }
                    if (state is JogosError) {
                      return DefaultError(sError: state.sError,);
                    }
                  },
                ),
              ),
            )
    );
  }
}

