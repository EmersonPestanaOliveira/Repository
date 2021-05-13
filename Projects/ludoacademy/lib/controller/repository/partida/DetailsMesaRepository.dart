import 'package:ludo_academy/controller/provider/partida/DetailsMesaProvider.dart';
import 'package:ludo_academy/controller/provider/partida/DetailsPartidaProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class DetailsMesaRepository {
  final DetailsMesaProvider oProvider = new DetailsMesaProvider();
  final DetailsPartidaProvider oProviderPartida = new DetailsPartidaProvider();

  Future<ServerResponse> partidaLoader({
    @required int partidaId,
  }) async {

    ServerResponse r = await oProviderPartida.loadPartida(partidaId);

    return r;
  }

  Future<ServerResponse> mesaLoader({
    @required int mesaId,
  }) async {

    ServerResponse r = await oProvider.loadMesa(mesaId);

    return r;
  }

  Future<ServerResponse> alunosLoader({
    @required int mesaId,
  }) async {

    ServerResponse r = await oProvider.loadAlunos(mesaId);

    return r;
  }

  Future<ServerResponse> fecharMesa ({
    @required String dados,
  }) async {

    ServerResponse r = await oProvider.fecharMesa(dados);

    return r;
  }
}