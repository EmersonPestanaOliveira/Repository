import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/home/historico/HistoricoEvent.dart';
import 'package:ludo_academy/model/home/historico/HistoricoState.dart';
import 'package:ludo_academy/view/blocs/home/HistoricoBloc.dart';
import 'package:ludo_academy/view/widgets/DefaultError.dart';
import 'package:ludo_academy/view/widgets/DefaultLoading.dart';
import 'package:ludo_academy/view/widgets/home/historico/HistoricoList.dart';
import 'package:ludo_academy/view/widgets/home/historico/HistoricoListEmpty.dart';

class Historico extends StatefulWidget {
  @override
  State createState() {
    return new HistoricoStates();
  }
}

class HistoricoStates extends State<Historico> {

  //final AuthenticationBloc authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);

  HistoricoList oHistoricoList;

  @override
  void initState() {
    super.initState();
  }

  void fUpdate() {
    setState(() {
      BlocProvider.of<HistoricoBloc>(context).dispatch(HistoricoLoad());
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SafeArea(
          top: false,
          bottom: false,
          child: Container(
            color: new Color(0xFFf1f1f1),
            child: BlocBuilder<HistoricoEvent, HistoricoState>(
              bloc: BlocProvider.of<HistoricoBloc>(context),
              builder: (BuildContext context, HistoricoState state) {

                if (state is HistoricoUninitialized) {
                  return DefaultLoading();
                }
                if (state is HistoricoLoading) {
                  return DefaultLoading();
                }
                if (state is HistoricoEmpty) {
                  return HistoricoListEmpty();
                }
                if (state is HistoricoInitialized) {
                  oHistoricoList = new HistoricoList(items: state.oPartidas);
                  return oHistoricoList;
                }
                if (state is HistoricoError) {
                  return DefaultError(sError: state.sError,);
                }
              },
            ),
          ),
        )
    );
  }
}

