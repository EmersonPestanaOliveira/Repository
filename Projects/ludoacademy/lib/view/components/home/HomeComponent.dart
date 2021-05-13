import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/help/AlertHelper.dart';
import 'package:ludo_academy/model/home/blog/BlogEvent.dart';
import 'package:ludo_academy/model/home/historico/HistoricoEvent.dart';
import 'package:ludo_academy/model/home/jogos/JogosEvent.dart';
import 'package:ludo_academy/model/home/alunos/AlunosEvent.dart';
import 'package:ludo_academy/model/home/alunos/TurmaEvent.dart';
import 'package:ludo_academy/model/login/AuthenticationEvent.dart';
import 'package:ludo_academy/view/blocs/AuthenticationBloc.dart';
import 'package:ludo_academy/view/blocs/home/AlunosBloc.dart';
import 'package:ludo_academy/view/blocs/home/BlogBloc.dart';
import 'package:ludo_academy/view/blocs/home/HistoricoBloc.dart';
import 'package:ludo_academy/view/blocs/home/JogosBloc.dart';
import 'package:ludo_academy/view/blocs/home/TurmaBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/presenca/PresencaBloc.dart';
import 'package:ludo_academy/view/fonts/ludo_icons_icons.dart';
import 'package:ludo_academy/view/widgets/home/alunos/Alunos.dart';
import 'package:ludo_academy/view/widgets/home/alunos/Turma.dart';
import 'package:ludo_academy/view/widgets/home/blog/BlogContainer.dart';
import 'package:ludo_academy/view/widgets/home/historico/Historico.dart';
import 'package:ludo_academy/view/widgets/home/jogos/Jogos.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

enum ActionsMenu { ChangeSchool, Logout }

class HomeComponent extends StatefulWidget {
  const HomeComponent({Key key}) : super(key: key);

  @override
  State createState() => new HomeComponentState();
}

class HomeComponentState extends State<HomeComponent> with SingleTickerProviderStateMixin {

  TabController oTabController;

  TurmaBloc oTurmaBloc = new TurmaBloc(oTurmaRepository: Application.oRepositoryTurma);
  PresencaBloc oPresencaBloc = new PresencaBloc(oPresencaRepository: Application.oRepositoryPresenca);
  HistoricoBloc oHistoricoBloc = new HistoricoBloc(oHistoricoRepository: Application.oRepositoryHistorico);

  Historico oHistorico;

  @override
  void initState() {
    oTabController = new TabController(vsync: this, length: 4);
    oTabController.addListener(fHandleTabChange);

    print ("homecomponent initState");

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
    oTabController.dispose();
  }

  void fHandleTabChange() {
    setState(() {
      print ("mudando");
    });
  }

  void forceUpdate() {

    AuthenticationBloc auth = BlocProvider.of<AuthenticationBloc>(context);
    auth.dispatch(AppRefresh());

    //setState(() async {




      //Navigator.pop(context);

      //oHistoricoBloc.dispose();
      //oHistoricoBloc = new HistoricoBloc(oHistoricoRepository: Application.oRepositoryHistorico)..dispatch(HistoricoInit());
      //oTabController.index = -1;
      //await new Future.delayed(const Duration(milliseconds: 400));
      //oTabController.animateTo(0, duration: const Duration(milliseconds: 10));



    //});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitScope,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<ActionsMenu>(
              icon: Icon(Icons.more_vert, color: AppTheme.cDefaultTextColor2),
              onSelected: (ActionsMenu result) {
                switch (result) {
                  case ActionsMenu.ChangeSchool:
                    Application.oRouter.navigateTo(
                        context,
                        '/changeschool/' + Application.oProfile.usuarioId.toString(),
                        transition:
                        TransitionType
                            .inFromRight)
                        .then((result) {});
                    break;
                  case ActionsMenu.Logout:
                    showLogoutScope();
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<ActionsMenu>>[
                const PopupMenuItem<ActionsMenu>(
                  value: ActionsMenu.ChangeSchool,
                  child: Text('Mudar Escola'),
                ),
                const PopupMenuItem<ActionsMenu>(
                  value: ActionsMenu.Logout,
                  child: Text('Sair'),
                ),
              ],
            )
          ],
          backgroundColor: new Color(0xFFf1f1f1),
          elevation: 0,
          centerTitle: true,
          bottom: TabBar(
            controller: oTabController,
            onTap: (tab) {

              if (tab == 0) {
                //forceUpdate();
              }
            },
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelStyle: TextStyle(
              fontSize: 10,
              fontFamily: AppTheme.fDefaultTextFont,
              fontWeight: FontWeight.bold
            ),
            labelColor: AppTheme.cDefaultLabelColorSelected,
            unselectedLabelColor: AppTheme.cDefaultLabelColor,
            labelStyle: TextStyle(
              fontSize: 10,
              fontFamily: AppTheme.fDefaultTextFont,
              fontWeight: FontWeight.bold
            ),
            tabs: [
              Tab(
                icon: Icon(LudoIcons.historico),
                text: "HISTÓRICO",
              ),
              Tab(
                icon: Icon(LudoIcons.alunos),
                text: "ALUNOS",
              ),
              Tab(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 3, 15, 0),
                    child: Icon(LudoIcons.jogos,
                    size: 21,)
                ),
                text: "JOGOS",
              ),
              Tab(
                icon: Icon(LudoIcons.blog),
                text: "BLOG",
              ),
            ],
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(Application.oProfile.nome.toUpperCase(),
                style: TextStyle(
                  color: new Color(0xFFbbbbbb),
                  fontSize: 12,
                  fontFamily: AppTheme.fDefaultTextFont,
                  fontWeight: FontWeight.bold
                )
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:  new Color(0xFF00b4ff),
                ),
                child: Text(Application.oProfile.nome.substring(0, 1) + Application.oProfile.sobrenome.substring(0, 1),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  )
                ),
              ),
              Text(Application.oProfile.escolaNome.toUpperCase(),
                  style: TextStyle(
                      color: new Color(0xFFbbbbbb),
                      fontSize: 12,
                      fontFamily: AppTheme.fDefaultTextFont,
                  )
              ),
            ]
          ),
        ),
        body: TabBarView(
          controller: oTabController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            BlocProvider<HistoricoBloc>(
                builder: (context) {
                  return new HistoricoBloc(oHistoricoRepository: Application.oRepositoryHistorico)..dispatch(HistoricoLoad());
                },
                child: Historico()
            ),
            Container(
              color: new Color(0xFFf1f1f1),
              child: Column(
                children: <Widget>[
                  BlocProvider<TurmaBloc>(
                      builder: (context) {
                        return oTurmaBloc..dispatch(TurmaLoad());
                      },
                      child: Turma()
                  ),
                  BlocProvider<AlunosBloc>(
                      builder: (context) {
                        return AlunosBloc(oPresencaBloc: oPresencaBloc, oTurmaBloc: oTurmaBloc, oAlunosRepository: Application.oRepositoryAlunos)..dispatch(AlunosLoad(false));
                      },
                      child: Alunos()
                  ),
                ],
              ),
            ),

            BlocProvider<JogosBloc>(
                builder: (context1) {
                  return JogosBloc(oJogosRepository: Application.oRepositoryJogos)..dispatch(JogosLoad(escolaId: 0));
                },
                child: Jogos()
            ),
            BlocProvider<BlogBloc>(
                builder: (context) {
                  return BlogBloc(oBlogRepository: Application.oRepositoryBlog)..dispatch(BlogLoad());
                },
                child: BlogContainer()
            ),
          ],
        ),
        floatingActionButton: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {

              // TODO limitar nova partida

              Application.oRouter.navigateTo(
                  context,
                  '/novapartida',
                  transition:
                  TransitionType
                      .inFromBottom)
                  .then((result) {

              });
            },
            child: Icon(LudoIcons.partida, color: Colors.white, size: 35),
            foregroundColor: AppTheme.cDefaultButtonBackground,
            tooltip: "ADICIONAR PARTIDA",
          ),
        ),
      ),
    );
  }

  Future<bool> exitScope() {

    showExitAlert();
    return Future.value(false);

    /*if (oTabController.index > 0) {
      oTabController.animateTo(0);

      //print ("defaulttab: " + DefaultTabController.of(context).toString());

      //DefaultTabController.of(context).animateTo(0);

      return Future.value(false);
    } else {
      showExitAlert();

      return Future.value(false);
    }*/
  }

  void showExitAlert() {
    List<DialogButton> _buttons = new List<DialogButton>();
    _buttons.addAll([
      DialogButton(
          radius: BorderRadius.all(Radius.circular(0)),
        child: Text(
          "SIM",
          style: AppTheme.botaoSim
        ),
        onPressed: () =>
            SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        color: AppTheme.cDefaultTextColor2
      ),
      DialogButton(
        radius: BorderRadius.all(Radius.circular(0)),
        child: Text(
          "NÃO",
          style: AppTheme.botaoNao
        ),
        onPressed: () => Navigator.pop(context),
        color: AppTheme.cDefaultTextColor2,
      ),
    ]);

    AlertStyle _style = AppTheme.alertaStyle;

    AlertHelper.showAlert(context, "SAIR", "Deseja sair do Aplicativo?",
        _buttons, _style, this);
  }

  void showLogoutScope() {
    List<DialogButton> _buttons = new List<DialogButton>();
    _buttons.addAll([
      DialogButton(
          radius: BorderRadius.all(Radius.circular(0)),
          child: Text(
            "SIM",
            style: AppTheme.botaoSim
          ),
          onPressed: () {
            AuthenticationBloc auth = BlocProvider.of<AuthenticationBloc>(context);
            auth.dispatch(LoggedOut());
            Navigator.pop(context);
          },
          color: AppTheme.cDefaultTextColor2
      ),
      DialogButton(
        radius: BorderRadius.all(Radius.circular(0)),
        child: Text(
          "NÃO",
          style: AppTheme.botaoNao
        ),
        onPressed: () => Navigator.pop(context),
        color: AppTheme.cDefaultTextColor2,
      ),
    ]);

    AlertStyle _style = AppTheme.alertaStyle;

    AlertHelper.showAlert(context, "LOGOUT", "Deseja fazer o logout?",
        _buttons, _style, this);
  }
}