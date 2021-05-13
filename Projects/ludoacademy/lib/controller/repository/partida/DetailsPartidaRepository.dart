import 'package:ludo_academy/controller/provider/partida/DetailsPartidaProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class DetailsPartidaRepository {
  final DetailsPartidaProvider oProvider = new DetailsPartidaProvider();

  Future<ServerResponse> partidaLoader({
    @required int partidaId,
  }) async {

    ServerResponse r = await oProvider.loadPartida(partidaId);

    return r;
  }

  Future<ServerResponse> mesasLoader({
    @required int partidaId,
  }) async {

    ServerResponse r = await oProvider.loadMesas(partidaId);

    return r;
  }

  Future<ServerResponse> fecharPartida ({
    @required int partidaId,
  }) async {

    ServerResponse r = await oProvider.fecharPartida(partidaId);

    return r;
  }
}