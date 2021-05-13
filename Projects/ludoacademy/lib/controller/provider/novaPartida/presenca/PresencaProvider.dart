import 'dart:async';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:dio/dio.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';


class PresencaProvider {
  Future<ServerResponse> presencaAdd(int nTurma, int nId) async {

    FormData params = new FormData();
    params['presenca_turma_id'] = nTurma;
    params['presenca_usuario_id'] = nId;

    ServerResponse _data = await HttpHelper.postCall("presenca", params);

    return _data;
  }
}