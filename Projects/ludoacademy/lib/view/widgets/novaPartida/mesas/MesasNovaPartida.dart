import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesasEvent.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesasState.dart';
import 'package:ludo_academy/view/blocs/novaPartida/mesas/MesasBloc.dart';
import 'package:ludo_academy/view/widgets/DefaultError.dart';
import 'package:ludo_academy/view/widgets/DefaultLoading.dart';
import 'package:ludo_academy/view/widgets/novaPartida/mesas/MesasNovaPartidaList.dart';

class MesasNovaPartida extends StatefulWidget {
  @override
  State createState() {
    return new MesasNovaPartidaWidgetState();
  }
}

class MesasNovaPartidaWidgetState extends State<MesasNovaPartida> {
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
                child: BlocBuilder<MesasEvent, MesasState>(
                  bloc: BlocProvider.of<MesasBloc>(context),
                  builder: (BuildContext context, MesasState state) {

                    if (state is MesasLoading) {
                      return DefaultLoading();
                    }
                    if (state is MesasUninitialized) {
                      return DefaultLoading();
                    }
                    if (state is MesasGenerating) {
                      return Column (
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                          Text("ORGANIZANDO MESAS", style:
                            TextStyle(
                              fontSize: 16,
                              fontFamily: AppTheme.fDefaultTextFont,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.cDefaultTextColor2
                            )),
                          Divider(),
                          DefaultLoading()
                        ],
                      );
                    }
                    if (state is MesasInitialized) {

                      return MesasNovaPartidaList();
                    }
                    if (state is MesasReturn) {
                      return DefaultLoading();
                    }
                    if (state is MesasError) {
                      return DefaultError(sError: state.sError);
                    }

                  },
                ),
              ),
            )
    );
  }
}

