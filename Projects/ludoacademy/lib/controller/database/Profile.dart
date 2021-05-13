class Profile {

  int _iUsuarioId;
  int _iEscolaId;
  String _sNome;
  String _sAvatar;

  // ignore: unnecessary_getters_setters
  int get iUsuarioId => _iUsuarioId;
  // ignore: unnecessary_getters_setters
  int get iEscolaId => _iEscolaId;
  // ignore: unnecessary_getters_setters
  String get sNome => _sNome;
  // ignore: unnecessary_getters_setters
  String get sAvatar => _sAvatar;

  // ignore: unnecessary_getters_setters
  set iUsuarioId(int iUsuarioId) { _iUsuarioId = iUsuarioId; }
  // ignore: unnecessary_getters_setters
  set iEscolaId(int iEscolaId) { _iEscolaId = iEscolaId; }
  // ignore: unnecessary_getters_setters
  set sNome(String sNome) { _sNome = sNome; }
  // ignore: unnecessary_getters_setters
  set sAvatar(String sAvatar) { _sAvatar = sAvatar; }

  Profile();
}
