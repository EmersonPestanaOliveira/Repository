import 'package:ludo_academy/controller/provider/usuario/UsuarioProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class UsuarioRepository {
  final UsuarioProvider oProvider = new UsuarioProvider();

  Future<ServerResponse> alunoLoader({
    @required String usuario,
  }) async {

    ServerResponse r = await oProvider.fetchUser(usuario);

    return r;
  }
}