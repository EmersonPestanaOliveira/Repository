class Turma {
  final int id;
  final int escolaId;
  final int usuarioId;
  final String nome;
  final int ativo;
  final String data;
  final String alteracao;

  Turma(this.id, this.escolaId, this.usuarioId, this.nome, this.ativo, this.data, this.alteracao);

  Turma.fromJson(dynamic json)
  : id = int.parse(json['turma_id']),
  escolaId = int.parse(json['turma_escola_id']),
  usuarioId = int.parse(json['turma_usuario_id']),
  nome = json['turma_nome'],
  ativo = int.parse(json['turma_ativo']),
  data = json['turma_data'],
  alteracao = json['turma_alteracao'];
}