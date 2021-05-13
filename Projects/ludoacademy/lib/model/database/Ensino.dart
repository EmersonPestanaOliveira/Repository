class Ensino {
  final int id;
  final String nome;
  final int min;
  final int max;
  final int ativo;

  Ensino (this.id, this.nome, this.min, this.max, this.ativo);

  Ensino.fromJson(dynamic json)
    : id = int.parse(json['ensino_id']),
      nome = json['ensino_nome'],
      min = int.parse(json['ensino_min']),
      max = int.parse(json['ensino_max']),
      ativo = int.parse(json['ensino_ativo']);
}