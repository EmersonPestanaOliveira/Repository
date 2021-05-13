class InteligenciaCompetencia {
  final int id;
  final int inteId;
  final int compId;
  final int ativo;
  final String data;

  InteligenciaCompetencia(this.id, this.inteId, this.compId, this.ativo, this.data);

  InteligenciaCompetencia.fromJson(dynamic json)
      : id = int.parse(json['ic_id']),
        inteId = int.parse(json["ic_intel_id"]),
        compId = int.parse(json["ic_comp_id"]),
        ativo = int.parse(json["ic_ativo"]),
        data = json['ic_data'];
}