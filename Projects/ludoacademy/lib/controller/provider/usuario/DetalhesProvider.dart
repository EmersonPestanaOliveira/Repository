import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class DetalhesProvider {
  Future<ServerResponse> fetchDetails(String usuario) async {

    var params = new Map<String, dynamic>();

    ServerResponse _data = await HttpHelper.getCall("competencia/valores/" + usuario, params);

    return _data;
  }
}