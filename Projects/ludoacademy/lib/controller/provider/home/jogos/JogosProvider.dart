import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class JogosProvider {
  Future<ServerResponse> loadJogos(int escola) async {

    var params = new Map<String, dynamic>();
    params['escola_id'] = escola;

    ServerResponse _data = await HttpHelper.getCall("jogo", params);

    return _data;
  }
}