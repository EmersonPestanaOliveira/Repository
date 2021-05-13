import 'package:ludo_academy/controller/provider/inteligencia/InteligenciaProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class InteligenciaRepository {
  final InteligenciaProvider oProvider = new InteligenciaProvider();

  Future<ServerResponse> inteligenciaLoader({
    @required int userId

  }) async {

    ServerResponse r = await oProvider.fetchListIntel(userId);

    return r;
  }
}