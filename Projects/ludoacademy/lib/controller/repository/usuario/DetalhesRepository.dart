import 'package:ludo_academy/controller/provider/usuario/DetalhesProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class DetalhesRepository {
  final DetalhesProvider oProvider = new DetalhesProvider();

  Future<ServerResponse> detalhesLoader({
    @required String usuario,
  }) async {

    ServerResponse r = await oProvider.fetchDetails(usuario);

    return r;
  }
}