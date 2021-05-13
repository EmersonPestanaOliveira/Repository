import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class DetailsPartidaProvider {

  Future<ServerResponse> loadPartida(int partidaId) async {

    var params = new Map<String, dynamic>();
    params['partida_id'] = partidaId;

    ServerResponse _data = await HttpHelper.getCall("partida/id", params);

    return _data;
  }

  Future<ServerResponse> loadMesas(int partidaId) async {

    var params = new Map<String, dynamic>();
    params['partida_id'] = partidaId;

    ServerResponse _data = await HttpHelper.getCall("partida/mesas", params);

    return _data;
  }

  Future<ServerResponse> fecharPartida(int partidaId) async {

    FormData params = new FormData.from({'partida_id': partidaId });

    ServerResponse _data = await HttpHelper.postCall("partida/finalizar", params);

    return _data;
  }
}