class Presenca {
  final int id;
  final int turmaId;
  final int usuarioId;
  final String data;

  Presenca(this.id, this.turmaId, this.usuarioId, this.data);

  Presenca.fromJson(dynamic json)
  : id = int.parse(json['presenca_id']),
    turmaId = int.parse(json['presenca_turma_id']),
    usuarioId = int.parse(json['presenca_usuario_id']),
    data = json['presenca_data'];
}