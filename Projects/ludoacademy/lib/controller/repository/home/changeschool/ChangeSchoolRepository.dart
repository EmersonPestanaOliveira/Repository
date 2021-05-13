import 'package:ludo_academy/controller/provider/home/changeschool/ChangeSchoolProvider.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';

class ChangeSchoolRepository {
  final ChangeSchoolProvider oProvider = new ChangeSchoolProvider();

  Future<ServerResponse> escolaLoader({
    @required int usuarioId,
  }) async {

    ServerResponse r = await oProvider.loadEscolas(usuarioId);

    return r;
  }
}