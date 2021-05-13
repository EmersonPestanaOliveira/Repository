import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class InteligenciaProvider {
  Future<ServerResponse> fetchListIntel(int userId) async {

    var params = new Map<String, dynamic>();
    params['usuario_id'] = userId;

    ServerResponse _data = await HttpHelper.getCall("lista/inteligencia", params);

    return _data;
  }
}