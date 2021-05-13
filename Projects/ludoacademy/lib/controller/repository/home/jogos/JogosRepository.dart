import 'package:ludo_academy/controller/provider/home/jogos/JogosProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class JogosRepository {

  final JogosProvider oProvider = new JogosProvider();

  Future<ServerResponse> jogosLoader(int escolaId) async {

    ServerResponse r = await oProvider.loadJogos(escolaId);

    return r;
  }
}