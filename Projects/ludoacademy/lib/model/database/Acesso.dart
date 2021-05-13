class Acesso {
  final int id;
  final int usuarioId;
  final int usuarioTipo;
  int escolaId;
  final String login;
  final String senha;
  final int ativo;
  final String data;
  final String alteracao;
  final String nome;
  final String sobrenome;
  String escolaNome;

  Acesso(this.id, this.usuarioId, this.usuarioTipo, this.escolaId, this.login, this.senha, this.ativo, this.data, this.alteracao, this.nome, this.sobrenome, this.escolaNome);

  Acesso.fromJson(List<dynamic> json)
      : id = int.parse(json[0]['acesso_id']),
        usuarioId = int.parse(json[0]['acesso_usuario_id']),
        usuarioTipo = int.parse(json[0]['acesso_usuario_tipo']),
        escolaId = int.parse(json[0]['acesso_escola_id']),
        login = json[0]["acesso_login"],
        senha = json[0]["acesso_senha"],
        ativo = int.parse(json[0]["acesso_ativo"]),
        data = json[0]["acesso_data"],
        nome = json[0]["usuario_nome"],
        sobrenome = json[0]["usuario_sobrenome"],
        escolaNome = json[0]["escola_nome"],
        alteracao = json[0]["acesso_alteracao"];
}