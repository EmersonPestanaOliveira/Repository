import 'package:ludo_academy/controller/provider/novaPartida/mesas/MesasProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class MesasRepository {
  final MesasProvider oProvider = new MesasProvider();

  Future<ServerResponse> historicoLoader({
    @required int nTurmaId,
  }) async {

    ServerResponse r = await oProvider.historicoLoader(nTurmaId);

    return r;
  }
}