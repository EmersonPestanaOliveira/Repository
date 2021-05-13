class Inteligencia {
  final int id;
  final String nome;
  final int ativo;

  Inteligencia(this.id, this.nome, this.ativo);

  Inteligencia.fromJson(dynamic json)
      : id = int.parse(json['inte_id']),
        nome = json['inte_nome'],
        ativo = int.parse(json["inte_ativo"]);
}