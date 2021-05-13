import 'package:ludo_academy/controller/provider/game/GameProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class GameRepository {
  final GameProvider oProvider = new GameProvider();

  Future<ServerResponse> jogoLoader({
    @required int nId,
  }) async {

    print ("nid: " + nId.toString());

    ServerResponse r = await oProvider.fetchGame(nId);

    return r;
  }

  Future<ServerResponse> saveSolicitacao(int escolaId, int usuarioId, int jogoId) async {

    ServerResponse r = await oProvider.saveSolicitacao(escolaId, usuarioId, jogoId);

    return r;
  }
}