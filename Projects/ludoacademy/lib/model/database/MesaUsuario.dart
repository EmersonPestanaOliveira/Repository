class MesaUsuario {
  final int id;
  final int mesaId;
  final int usuarioId;
  final int ativo;
  final String data;
  final String alteracao;
  final String nome;
  final String sobrenome;

  MesaUsuario(this.id, this.mesaId, this.usuarioId, this.ativo, this.data, this.alteracao, this.nome, this.sobrenome);

  MesaUsuario.fromJson(dynamic json)
  : id = int.parse(json['mu_id']),
    mesaId = int.parse(json['mu_mesa_id']),
    usuarioId = int.parse(json['mu_usuario_id']),
    ativo = int.parse(json['mu_ativo']),
    data = json['mu_data'],
    alteracao = json['mu_alteracao'],
    nome = json['usuario_nome'],
    sobrenome = json['usuario_sobrenome'];
}