import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/home/alunos/AlunosEvent.dart';
import 'package:ludo_academy/model/home/alunos/AlunosState.dart';
import 'package:ludo_academy/view/blocs/home/AlunosBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/presenca/PresencaBloc.dart';
import 'package:ludo_academy/view/widgets/home/alunos/AlunosListEmpty.dart';
import 'package:ludo_academy/view/widgets/novaPartida/turma/AlunosNovaPartidaList.dart';

import '../../DefaultError.dart';
import '../../DefaultLoading.dart';

class AlunosNovaPartida extends StatefulWidget {

  final PresencaBloc oBlocPresenca;

  const AlunosNovaPartida({Key key, this.oBlocPresenca}) : super(key: key);

  @override
  State createState() {
    return new AlunosNovaPartidaWidgetState();
  }
}

class AlunosNovaPartidaWidgetState extends State<AlunosNovaPartida> {

  @override
  void initState() {

    //NovaPartidaBloc oNovaPartida = BlocProvider.of<NovaPartidaBloc>(context);
    //oNovaPartida.oNovaPartida.clearAlunos();
    //oNovaPartida.oNovaPartida.clearMesas();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //NovaPartidaBloc oNovaPartida = BlocProvider.of<NovaPartidaBloc>(context);

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

                    //oNovaPartida.oNovaPartida.clearAlunos();
                    //oNovaPartida.oNovaPartida.clearMesas();

                    return AlunosListEmpty();
                  }
                  if (state is AlunosInitialized) {


                    //oNovaPartida.oNovaPartida.clearAlunos();
                    //oNovaPartida.oNovaPartida.clearMesas();



                    return AlunosNovaPartidaList(oAlunos: state.oAlunos, oBlocPresenca: widget.oBlocPresenca);
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

