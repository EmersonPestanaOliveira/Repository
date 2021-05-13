class DadosCompetencia {
  final int inteligenciaId;
  final int competenciaId;
  final String inteligenciaNome;
  final String competenciaNome;
  int _valor;

  // ignore: unnecessary_getters_setters
  int get valor => _valor;

  // ignore: unnecessary_getters_setters
  set valor(int valor) {
    _valor = valor;
  }

  DadosCompetencia(this.inteligenciaId, this.competenciaId, this.inteligenciaNome, this.competenciaNome, this._valor);

  DadosCompetencia.fromJson(dynamic json)
      : inteligenciaId = int.parse(json['inte_id']),
        competenciaId = int.parse(json['comp_id']),
        inteligenciaNome = json['inte_nome'],
        competenciaNome = json['comp_nome'],
        _valor = 0;
}