import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/home/alunos/TurmaEvent.dart';
import 'package:ludo_academy/model/novaPartida/confirmacao/ConfirmacaoEvent.dart';
import 'package:ludo_academy/model/novaPartida/mesas/MesasEvent.dart';

import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/alunosMesas/AlunosMesasBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/confirmacao/ConfirmacaoBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/mesas/MesasBloc.dart';

import 'package:ludo_academy/model/home/jogos/JogosEvent.dart';

import 'package:ludo_academy/view/blocs/home/AlunosBloc.dart';
import 'package:ludo_academy/view/blocs/home/JogosBloc.dart';
import 'package:ludo_academy/view/blocs/home/TurmaBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/presenca/PresencaBloc.dart';
import 'package:ludo_academy/view/widgets/novaPartida/confirmacao/Confirmacao.dart';
import 'package:ludo_academy/view/widgets/novaPartida/jogos/JogosNovaPartida.dart';
import 'package:ludo_academy/view/widgets/novaPartida/mesas/MesasNovaPartida.dart';
import 'package:ludo_academy/view/widgets/novaPartida/turma/AlunosNovaPartida.dart';
import 'package:ludo_academy/view/widgets/novaPartida/turma/TurmaNovaPartida.dart';

class NovaPartidaComponent extends StatefulWidget {

  const NovaPartidaComponent({Key key}) : super(key: key);

  @override
  State createState() => new NovaPartidaStateComponent();
}

class NovaPartidaStateComponent extends State<NovaPartidaComponent> with SingleTickerProviderStateMixin {
  TabController oTabController;

  JogosBloc oBlocJogos;
  static TurmaBloc oBlocTurma;
  static PresencaBloc oBlocPresenca;
  MesasBloc oBlocMesas;
  AlunosMesasBloc oBlocAlunosMesas;

  AlunosBloc oBlocAlunos;

  ConfirmacaoBloc oBlocConfirmacao;

  NovaPartidaBloc oBlocNovaPartida;

  @override
  void initState() {
    super.initState();



    oTabController = new TabController(vsync: this, length: 4);
    
    oTabController.addListener(fHandleTabChange);

    oBlocJogos = new JogosBloc(oJogosRepository: Application.oRepositoryJogos);
    oBlocTurma = new TurmaBloc(oTurmaRepository: Application.oRepositoryTurma);
    oBlocPresenca = new PresencaBloc(oPresencaRepository: Application.oRepositoryPresenca);
    oBlocMesas = new MesasBloc(oMesaRepository: Application.oRepositoryMesas);
    oBlocAlunosMesas = new AlunosMesasBloc(oAlunosMesasRepository: Application.oRepositoryAlunosMesas);
    oBlocAlunos = new AlunosBloc(oPresencaBloc: oBlocPresenca, oTurmaBloc: oBlocTurma, oAlunosRepository: Application.oRepositoryAlunos);
    oBlocConfirmacao = new ConfirmacaoBloc(oConfirmacaoRepository: Application.oRepositoryConfirmacao);

    oBlocNovaPartida = new NovaPartidaBloc(oNovaPartidaRepository: Application.oRepositoryNovaPartida);

    oBlocNovaPartida.oNovaPartida.bMesasArranged = false;
    oBlocAlunos.oNovaPartidaBloc = oBlocNovaPartida;
  }

  void fHandleTabChange() {
    setState(() {
      print ("mudando");
    });
  }

  @override
  void dispose() {
    super.dispose();
    oTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios, color: AppTheme.cDefaultTextColor2),
          onTap: () {

            if (oTabController.index > 0) {
              oTabController.animateTo(oTabController.index-1);
            }
            else {
              Application.oRouter.pop(context);
            }
          },
        ),
        title: TituloAppBar(),
        centerTitle: true,
        backgroundColor: new Color(0xFFf1f1f1),
        elevation: 0,

      ),
      body: BlocProvider<NovaPartidaBloc> (
        builder: (context) {
          return oBlocNovaPartida;
        },
        child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: oTabController,
            children: <Widget>[
              BlocProvider<JogosBloc>(
                  builder: (context) {
                    return oBlocJogos..dispatch(JogosLoad(escolaId: Application.oProfile.escolaId));
                  },
                  child: new JogosNovaPartida()
              ),
              Container(
                color: new Color(0xFFf1f1f1),
                child: Column(
                  children: <Widget>[
                    BlocProvider<TurmaBloc>(
                        builder: (context) {
                          return oBlocTurma..dispatch(TurmaLoad());
                        },
                        child: TurmaNovaPartida()
                    ),
                    BlocProvider<AlunosBloc>(
                        builder: (context) {
                          return oBlocAlunos;
                        },
                        child: AlunosNovaPartida(
                            oBlocPresenca: oBlocPresenca)
                    ),
                  ],
                ),
              ),
              BlocProvider<MesasBloc>(
                  builder: (context1) {
                    return oBlocMesas..dispatch(MesasGeneratorLoad(oBlocNovaPartida));
                  },
                  child: MesasNovaPartida()
              ),
              BlocProvider<ConfirmacaoBloc>(
                  builder: (context) {
                    return oBlocConfirmacao..dispatch(ConfirmacaoLoad(oNovaPartida: oBlocNovaPartida));
                  },
                  child: Confirmacao()
              )
            ],
        ),
      ),
      floatingActionButton: FloatingNextButton(oBlocNovaPartida: oBlocNovaPartida)
    );
  }
}

class TituloAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    String titulo = "NOVA PARTIDA";

    int index = Application.kTab.currentState.oTabController.index;

    switch (index) {
      case 1:
        titulo = "LISTA DE PRESENÇA";
        break;
      case 2:
        titulo = "LISTA DE MESAS";
        break;
      case 3:
        titulo = "RESUMO";
        break;
    }

    return Text(titulo,
        style: TextStyle(
            fontSize: 16,
            color: AppTheme.cDefaultTextColor2
        ));
  }
}

class FloatingNextButton extends StatelessWidget {

  final NovaPartidaBloc oBlocNovaPartida;

  const FloatingNextButton({Key key, this.oBlocNovaPartida}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int index = Application.kTab.currentState.oTabController.index;

    switch (index) {
      case 1:
        return FloatingActionButton(
            onPressed: () {

              if (Application.lPartidas.contains(oBlocNovaPartida.oNovaPartida.iTurma)) {
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text("A turma selecionada já está com uma partida aberta"),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }



              if (oBlocNovaPartida.oNovaPartida.lAlunos.length >= oBlocNovaPartida.oNovaPartida.oJogo.jogMin) {
                Application.kTab.currentState.oTabController.animateTo(Application.kTab.currentState.oTabController.index+1);
              }
              else {
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('O jogo necessita de, pelo menos, ' + oBlocNovaPartida.oNovaPartida.oJogo.jogMin.toString()
                        + " jogadores."),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25)
        );
        break;
      case 2:

        return FloatingActionButton(
            onPressed: () {

              if (oBlocNovaPartida.oNovaPartida.checkMesas()) {
                Application.kTab.currentState.oTabController.animateTo(Application.kTab.currentState.oTabController.index+1);
              }
              else {
                Scaffold.of(context).hideCurrentSnackBar();
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Todas as mesas devem ter ' + oBlocNovaPartida.oNovaPartida.oJogo.jogMin.toString()
                        + " jogadores e todos os alunos devem ser posicionados"),
                    backgroundColor: Colors.redAccent,
                  ),
                );
              }
            },
            child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 25)
        );
        break;
      default:
        return Container();
        break;
    }
  }
}