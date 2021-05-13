import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/novaPartida/confirmacao/ConfirmacaoEvent.dart';
import 'package:ludo_academy/model/novaPartida/confirmacao/ConfirmacaoState.dart';
import 'package:ludo_academy/view/blocs/novaPartida/confirmacao/ConfirmacaoBloc.dart';
import 'package:ludo_academy/view/widgets/DefaultError.dart';
import 'package:ludo_academy/view/widgets/DefaultLoading.dart';
import 'package:ludo_academy/view/widgets/novaPartida/confirmacao/ConfirmacaoForm.dart';

class Confirmacao extends StatefulWidget {
  @override
  State createState() => new ConfirmacaoStateComponent();
}

class ConfirmacaoStateComponent extends State<Confirmacao> {

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
                color: new Color(0xFF089EDD),
                child: BlocBuilder<ConfirmacaoEvent, ConfirmacaoState>(
                  bloc: BlocProvider.of<ConfirmacaoBloc>(context),
                  builder: (BuildContext context, ConfirmacaoState state) {
                    if (state is ConfirmacaoUninitialized) {
                      return DefaultLoading();
                    }
                    if (state is ConfirmacaoEmpty) {
                      return DefaultLoading();
                    }
                    if (state is ConfirmacaoInitialized) {
                      return ConfirmacaoForm(key: Application.kConfirmacao, oNovaPartidaBloc: state.oNovaPartidaBloc);
                    }
                    if (state is ConfirmacaoError) {
                      return DefaultError(sError: state.sError);
                    }
                  },
                ),
              ),
            )
    );
  }
}