import 'dart:async';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';


class HistoricoProvider {
  Future<ServerResponse> loadPartidas(String usuario, int escola) async {

    var params = new Map<String, dynamic>();
    params['usuario_id'] = usuario;
    params['usuario_escola'] = escola;

    ServerResponse _data = await HttpHelper.getCall("partida", params);

    return _data;
  }
}