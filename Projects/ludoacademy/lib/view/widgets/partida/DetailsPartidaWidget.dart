import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/partida/DetailsPartidaEvent.dart';
import 'package:ludo_academy/model/partida/DetailsPartidaState.dart';
import 'package:ludo_academy/view/blocs/partida/DetailsPartidaBloc.dart';
import 'package:ludo_academy/view/widgets/DefaultError.dart';
import 'package:ludo_academy/view/widgets/DefaultLoading.dart';
import 'package:ludo_academy/view/widgets/partida/DetailsPartidaPage.dart';


class DetailsPartidaWidget extends StatefulWidget {

  @override
  State createState() {
    return new DetailsPartidaWidgetState();
  }
}

class DetailsPartidaWidgetState extends State<DetailsPartidaWidget> {

  @override
    Widget build(BuildContext context) {
      return LayoutBuilder(
          builder: (context, constraints) =>
              SafeArea(
                top: false,
                bottom: false,
                child: Container(
                  color: new Color(0xFFf1f1f1),
                  child: BlocBuilder<DetailsPartidaEvent, DetailsPartidaState>(
                    bloc: BlocProvider.of<DetailsPartidaBloc>(context),
                    builder: (BuildContext context, DetailsPartidaState state) {
                      if (state is DetailsPartidaLoading) {
                        return DefaultLoading();
                      }
                      if (state is DetailsPartidaEmpty) {
                        return DefaultLoading();
                      }
                      if (state is DetailsPartidaUninitialized) {
                        return DefaultLoading();
                      }
                      if (state is DetailsPartidaInitialized) {
                        return DetailsPartidaPage(oPartida: state.oPartida, oMesas: state.oMesas);
                      }
                      if (state is DetailsPartidaError) {
                        return DefaultError(sError: state.sError);
                      }
                    },
                  ),
                ),
              )
      );
    }
  }