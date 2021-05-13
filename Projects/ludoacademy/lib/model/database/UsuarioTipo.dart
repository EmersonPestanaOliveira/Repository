class UsuarioTipo {
  final int id;
  final String nome;
  final int ativo;

  UsuarioTipo(this.id, this.nome, this.ativo);

  UsuarioTipo.fromJson(dynamic json)
  : id = int.parse(json['ut_id']),
  nome = json['ut_nome'],
  ativo = int.parse(json['ut_ativo']);
}