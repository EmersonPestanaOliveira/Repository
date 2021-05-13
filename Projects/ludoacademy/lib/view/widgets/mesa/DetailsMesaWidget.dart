import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/partida/DetailsMesaEvent.dart';
import 'package:ludo_academy/model/partida/DetailsMesaState.dart';
import 'package:ludo_academy/view/blocs/partida/DetailsMesaBloc.dart';
import 'package:ludo_academy/view/widgets/DefaultError.dart';
import 'package:ludo_academy/view/widgets/DefaultLoading.dart';
import 'package:ludo_academy/view/widgets/mesa/DetailsMesaPage.dart';


class DetailsMesaWidget extends StatefulWidget {

  @override
  State createState() {
    return new DetailsMesaWidgetState();
  }
}

class DetailsMesaWidgetState extends State<DetailsMesaWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
      return LayoutBuilder(
          builder: (context, constraints) =>
              SafeArea(
                top: false,
                bottom: false,
                child: Container(
                  color: new Color(0xFFf1f1f1),
                  child: BlocBuilder<DetailsMesaEvent, DetailsMesaState>(
                    bloc: BlocProvider.of<DetailsMesaBloc>(context),
                    builder: (BuildContext context, DetailsMesaState state) {
                      if (state is DetailsMesaLoading) {
                        return DefaultLoading();
                      }
                      if (state is DetailsMesaEmpty) {
                        return DefaultLoading();
                      }
                      if (state is DetailsMesaUninitialized) {
                        return DefaultLoading();
                      }
                      if (state is DetailsMesaInitialized) {
                        return DetailsMesaPage(key: Application.kDetailsMesa, oAlunos: state.oAlunos, oMesa: state.oMesa, oPartida: state.oPartida);
                      }
                      if (state is DetailsMesaError) {
                        return DefaultError(sError: state.sError);
                      }
                    },
                  ),
                ),
              )
      );
    }
  }