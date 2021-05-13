import 'package:fluro/fluro.dart';
import 'package:ludo_academy/controller/router/RouteHandlers.dart';
import 'package:flutter/material.dart';

class Routes {
  static String root = "/";
  static String blog = "/blog/:id";
  static String user = "/user/:id";
  static String game = "/game/:id";
  static String soon = "/soon";
  static String novaPartida = "/novapartida";
  static String changeSchool = "/changeschool/:id";
  static String partidaDetail = "/partida/:id";
  static String mesaDetail = "/mesa/:id/:partida";

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROTA NÃO ENCONTRADA");
        });

    router.define(root, handler: loginHandler);
    router.define(blog, handler: blogHandler);
    router.define(user, handler: userHandler);
    router.define(game, handler: gameHandler);
    router.define(soon, handler: soonHandler);
    router.define(novaPartida, handler: novaPartidaHandler);
    router.define(changeSchool, handler: changeSchoolHandler);
    router.define(partidaDetail, handler: detailsPartidaHandler);
    router.define(mesaDetail, handler: detailsMesaHandler);
  }
}
