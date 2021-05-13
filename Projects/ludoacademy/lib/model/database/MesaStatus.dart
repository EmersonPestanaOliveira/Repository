class MesaStatus {
  final int id;
  final String nome;

  MesaStatus(this.id, this.nome);

  MesaStatus.fromJson(dynamic json)
  : id = int.parse(json['ms_id']),
    nome = json['ms_nome'];
}