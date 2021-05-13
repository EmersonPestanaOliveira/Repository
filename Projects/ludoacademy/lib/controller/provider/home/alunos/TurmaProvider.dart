import 'dart:async';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class TurmaProvider {
  Future<ServerResponse> loadTurmas(String usuario, String escola) async {

    var params = new Map<String, dynamic>();
    params['usuario'] = usuario;
    params['escola'] = escola;

    ServerResponse _data = await HttpHelper.getCall("turma", params);

    return _data;
  }
}