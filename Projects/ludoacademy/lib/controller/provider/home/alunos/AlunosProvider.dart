import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class AlunosProvider {
  Future<ServerResponse> loadAlunos(String turma) async {

    var params = new Map<String, dynamic>();
    params['turma'] = turma;

    ServerResponse _data = await HttpHelper.getCall("usuario/turma", params);

    return _data;
  }
}