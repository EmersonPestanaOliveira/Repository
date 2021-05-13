import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class GameProvider {
  Future<ServerResponse> fetchGame(int nId) async {

    var params = new Map<String, dynamic>();
    //params['id'] = usuario;

    ServerResponse _data = await HttpHelper.getCall("jogo/" + nId.toString(), params);

    return _data;
  }

  Future<ServerResponse> saveSolicitacao(int escola, int usuario, int jogo) async {

    FormData params = new FormData.from({'js_escola_id': escola, 'js_usuario_id': usuario, 'js_jogo_id': jogo });

    ServerResponse _data = await HttpHelper.postCall("jogo/solicitacao", params);

    return _data;
  }
}