class CompetenciaValores {
  final int id;
  final int competenciaId;
  final int usuarioId;
  final int partidaId;
  final int mesaId;
  final int valor;
  final int ativo;
  final String data;

  CompetenciaValores(this.id, this.competenciaId, this.usuarioId, this.valor, this.ativo, this.data, this.partidaId, this.mesaId);

  CompetenciaValores.fromJson(dynamic json)
    : id = int.parse(json['cv_id']),
      competenciaId = int.parse(json['cv_comp_id']),
      usuarioId = int.parse(json['cv_usuario_id']),
      partidaId = int.parse(json['cv_partida_id']),
      mesaId = int.parse(json['cv_mesa_id']),
      valor = int.parse(json['cv_valor']),
      ativo = int.parse(json['cv_ativo']),
      data = json['cv_data'];
}