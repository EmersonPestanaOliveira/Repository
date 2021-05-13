import 'package:ludo_academy/controller/provider/novaPartida/presenca/PresencaProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class PresencaRepository {
  final PresencaProvider oProvider = new PresencaProvider();

  Future<ServerResponse> presencaAdd({
    @required int nId,
    @required int nTurma,
  }) async {

    ServerResponse r = await oProvider.presencaAdd(nTurma, nId);

    return r;
  }
}