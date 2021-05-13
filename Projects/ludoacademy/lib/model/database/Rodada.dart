class Rodada {
  final int id;
  final int sessaoId;
  final int ativo;
  final String data;
  final String alteracao;

  Rodada(this.id, this.sessaoId, this.ativo, this.data, this.alteracao);

  Rodada.fromJson(dynamic json)
  : id = int.parse(json['rodada_id']),
    sessaoId = int.parse(json['rodada_sessao_id']),
    ativo = int.parse(json['rodada_ativo']),
    data = json['rodada_data'],
    alteracao = json['rodada_alteracao'];
}