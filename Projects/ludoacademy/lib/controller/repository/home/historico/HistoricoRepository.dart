import 'package:ludo_academy/controller/provider/home/historico/HistoricoProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class HistoricoRepository {

  final HistoricoProvider oProvider = new HistoricoProvider();

  Future<ServerResponse> partidaLoader({
    @required String usuario,
    @required int escola,
  }) async {

    ServerResponse r = await oProvider.loadPartidas(usuario, escola);

    return r;
  }
}