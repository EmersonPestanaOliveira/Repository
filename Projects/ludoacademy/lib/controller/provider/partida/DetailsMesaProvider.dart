import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class DetailsMesaProvider {

  Future<ServerResponse> loadMesa(int mesaId) async {

    var params = new Map<String, dynamic>();
    params['mesa_id'] = mesaId;

    ServerResponse _data = await HttpHelper.getCall("mesa/id", params);

    return _data;
  }

  Future<ServerResponse> loadAlunos(int mesaId) async {

    var params = new Map<String, dynamic>();
    params['mu_mesa_id'] = mesaId;

    ServerResponse _data = await HttpHelper.getCall("mesa/usuario", params);

    return _data;
  }

  Future<ServerResponse> fecharMesa(String dados) async {

    FormData params = new FormData.from({'mesa_dados': dados });

    ServerResponse _data = await HttpHelper.postCall("mesa/finalizar", params);

    return _data;
  }
}