import 'dart:async';
import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';


class ConfirmacaoProvider {
  Future<ServerResponse> addPartida(String dados) async {

    FormData params = new FormData.from({'partida_dados': dados});

    ServerResponse _data = await HttpHelper.postCall("partida", params);

    return _data;
  }
}