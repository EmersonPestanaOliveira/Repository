import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class ChangeSchoolProvider {

  Future<ServerResponse> loadEscolas(int usuarioId) async {

    var params = new Map<String, dynamic>();

    ServerResponse _data = await HttpHelper.getCall("escola/usuario/" + usuarioId.toString(), params);

    return _data;
  }
}