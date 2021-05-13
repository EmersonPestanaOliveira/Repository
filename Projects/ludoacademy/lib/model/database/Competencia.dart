class Competencia {
  final int id;
  final String nome;
  final int ativo;


  Competencia(this.id, this.nome, this.ativo);

  Competencia.fromJson(dynamic json)
      : id = int.parse(json['comp_id']),
        nome = json["comp_nome"],
        ativo = int.parse(json["comp_ativo"]);
}