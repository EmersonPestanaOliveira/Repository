import 'package:ludo_academy/controller/provider/home/alunos/AlunosProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class AlunosRepository {
  final AlunosProvider oProvider = new AlunosProvider();

  Future<ServerResponse> alunosLoader({
    @required String turma,
  }) async {

    ServerResponse r = await oProvider.loadAlunos(turma);

    return r;
  }
}