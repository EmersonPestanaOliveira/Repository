import 'package:ludo_academy/controller/provider/novaPartida/confirmacao/ConfirmacaoProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class ConfirmacaoRepository {
  final ConfirmacaoProvider oProvider = new ConfirmacaoProvider();

  Future<ServerResponse> addPartida({
    @required String dados
  }) async {

    ServerResponse r = await oProvider.addPartida(dados);

    return r;
  }
}