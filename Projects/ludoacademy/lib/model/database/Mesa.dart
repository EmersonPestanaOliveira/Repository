class Mesa {
  final int id;
  final int usuarioId;
  final int partidaId;
  final int status;
  final int ativo;
  final String data;
  final String alteracao;
  final String usuarios;

  Mesa(this.id, this.usuarioId, this.partidaId, this.status, this.ativo, this.data, this.alteracao, this.usuarios);

  Mesa.fromJson (dynamic json)
  : id = int.parse(json['mesa_id']),
    usuarioId = int.parse(json['mesa_usuario_id']),
    partidaId = int.parse(json['mesa_partida_id']),
    status = int.parse(json['mesa_status']),
    ativo = int.parse(json['mesa_ativo']),
    data = json['mesa_data'],
    alteracao = json['mesa_alteracao'],
    usuarios = json['usuarios'];
}