import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/view/components/blog/BlogComponent.dart';
import 'package:ludo_academy/view/components/game/GameComponent.dart';
import 'package:ludo_academy/view/components/home/ChangeSchoolComponent.dart';
import 'package:ludo_academy/view/components/login/LoginComponent.dart';
import 'package:ludo_academy/view/components/novaPartida/NovaPartidaComponent.dart';
import 'package:ludo_academy/view/components/partida/DetailsMesaComponent.dart';
import 'package:ludo_academy/view/components/partida/DetailsPartidaComponent.dart';
import 'package:ludo_academy/view/components/soon/SoonComponent.dart';
import 'package:ludo_academy/view/components/user/UserComponent.dart';

// ROOT / LOGIN
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new LoginComponent();
    });

var blogHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new BlogComponent(id: params["id"][0]);
    });

var userHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new UserComponent(id: params["id"][0]);
    });

var gameHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new GameComponent(key: Application.kDetailsGame, id: params["id"][0]);
    });

var soonHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new SoonComponent();
    });

var novaPartidaHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new NovaPartidaComponent(key: Application.kTab);
    });

var detailsPartidaHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new DetailsPartidaComponent(key: Application.kDetailsPartida, id: int.parse(params["id"][0]));
    });

var detailsMesaHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new DetailsMesaComponent(id: int.parse(params["id"][0]), partida: int.parse(params["partida"][0]));
    });

var changeSchoolHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new ChangeSchoolComponent(id: int.parse(params["id"][0]));
    });