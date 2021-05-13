import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class UsuarioProvider {
  Future<ServerResponse> fetchUser(String usuario) async {

    var params = new Map<String, dynamic>();
    params['id'] = usuario;

    ServerResponse _data = await HttpHelper.getCall("usuario", params);

    return _data;
  }
}