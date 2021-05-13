class Partida {
  final int id;
  final int turmaId;
  final int usuarioId;
  final int status;
  final String nomeTurma;
  final String nomeJogo;
  final int escolaId;
  final int jogoId;
  final String data;

  Partida(this.id, this.turmaId, this.usuarioId, this.status, this.data, this.nomeTurma, this.nomeJogo, this.escolaId, this.jogoId);

  Partida.fromJson(dynamic json)
      : id = int.parse(json['partida_id']),
        turmaId = int.parse(json['partida_turma_id']),
        status = int.parse(json['partida_status']),
        usuarioId = int.parse(json['partida_usuario_id']),
        nomeTurma = json['turma_nome'],
        nomeJogo = json['jogo_nome'],
        data = json['partida_data'],
        escolaId = int.parse(json['partida_escola_id']),
        jogoId = int.parse(json['partida_jogo_id']);
}