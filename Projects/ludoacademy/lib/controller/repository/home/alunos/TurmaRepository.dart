import 'package:ludo_academy/controller/provider/home/alunos/TurmaProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class TurmaRepository {
  final TurmaProvider oProvider = new TurmaProvider();

  Future<ServerResponse> turmaLoader({
    @required String usuario,
    @required String escola,
  }) async {

    ServerResponse r = await oProvider.loadTurmas(usuario, escola);

    return r;
  }
}