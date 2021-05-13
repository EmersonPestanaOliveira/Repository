import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class MesasProvider {
  Future<ServerResponse> historicoLoader(int nTurmaId) async {

    var params = new Map<String, dynamic>();
    params['turma_id'] = nTurmaId;

    ServerResponse _data = await HttpHelper.getCall("partida/historico", params);

    return _data;
  }
}