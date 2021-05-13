class JogoCompetencia {
  final int id;
  final int jogoId;
  final int compId;
  final int valor;
  final int ativo;

  JogoCompetencia(this.id, this.jogoId, this.compId, this.valor, this.ativo);

  JogoCompetencia.fromJson(dynamic json)
      : id = int.parse(json['jc_id']),
        jogoId = int.parse(json['jc_jogo_id']),
        compId = int.parse(json['jc_comp_id']),
        valor = int.parse(json['jc_valor']),
        ativo = int.parse(json['jc_ativo']);
}