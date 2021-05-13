import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/config/SimpleBlocDelegate.dart';
import 'package:ludo_academy/controller/repository/acesso/AcessoRepository.dart';
import 'package:ludo_academy/controller/router/Routes.dart';

class AppComponent extends StatefulWidget {
  //AppComponent({Key key}) : super(key: key);

  final AcessoRepository userRepository;

  AppComponent({Key key, @required this.userRepository}) : super(key: key);

  @override
  State createState() {
    return new AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.oRouter = router;

    BlocSupervisor.delegate = SimpleBlocDelegate();
  }

  @override
  Widget build(BuildContext context) {
    final app = new MaterialApp(
      title: 'Ludo Academy',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      showPerformanceOverlay: false,
      onGenerateRoute: Application.oRouter.generator,
    );
    //print("initial route = ${app.initialRoute}");
    return app;
  }
}
