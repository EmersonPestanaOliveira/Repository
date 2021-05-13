class Sessao {
  final int id;
  final int turmaId;
  final int ativo;
  final String data;
  final String alteracao;

  Sessao(this.id, this.turmaId, this.ativo, this.data, this.alteracao);

  Sessao.fromJson(dynamic json)
  : id = int.parse(json['sessao_id']),
  turmaId = int.parse(json['sessao_turma_id']),
  ativo = int.parse(json['sessao_ativo']),
  data = json['sessao_data'],
  alteracao = json['sessao_alteracao'];
}