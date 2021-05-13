class Usuario {
  final int id;
  final int tipoUsuarioId;
  final int escolaId;
  final int turmaId;
  final String avatar;
  final String nome;
  final String sobrenome;
  final String dataNascimento;
  final String rg;
  final String cpf;
  final String telefone;
  final String email;
  final int ativo;
  final String data;
  final String alteracao;
  final String turmaNome;

  Usuario(this.id, this.tipoUsuarioId, this.escolaId, this.turmaId, this.avatar, this.nome,
          this.sobrenome, this.dataNascimento, this.rg, this.cpf, this.telefone, this.email,
          this.ativo, this.data, this.alteracao, this.turmaNome);

  Usuario.fromJson(dynamic json)
  : id = int.parse(json['usuario_id']),
    tipoUsuarioId = int.parse(json['usuario_tipo_usuario_id']),
    escolaId = int.parse(json['usuario_escola_id']),
    turmaId = int.parse(json['usuario_turma_id']),
    avatar = json['usuario_avatar'],
    nome = json['usuario_nome'],
    sobrenome = json['usuario_sobrenome'],
    dataNascimento = json['usuario_dataNascimento'],
    rg = json['usuario_rg'],
    cpf = json['usuario_cpf'],
    telefone = json['usuario_telefone'],
    email = json['usuario_email'],
    ativo = int.parse(json['usuario_ativo']),
    data = json['usuario_data'],
    alteracao = json['usuario_alteracao'],
    turmaNome = json['turma_nome'];
}