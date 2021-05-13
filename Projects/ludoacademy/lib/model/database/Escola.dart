class Escola {
  final int id;
  final String nome;
  final String endereco;
  final String complemento;
  final String telefone;
  final String cep;
  final String bairro;
  final String cidade;
  final String estado;
  final String pais;
  final int ativo;
  final String data;
  final String alteracao;

  Escola(this.id, this.nome, this.endereco, this.complemento, this.telefone, this.cep, this.bairro, this.cidade, this.estado, this.pais, this.ativo, this.data, this.alteracao);

  Escola.fromJson (dynamic json)
  : id = int.parse(json['escola_id']),
    nome = json['escola_nome'],
    endereco = json['escola_endereco'],
    complemento = json['escola_complemento'],
    telefone = json['escola_telefone'],
    cep = json['escola_cep'],
    bairro = json['escola_bairro'],
    cidade = json['escola_cidade'],
    estado = json['escola_estado'],
    pais = json['escola_pais'],
    ativo = int.parse(json['escola_ativo']),
    data = json['escola_data'],
    alteracao = json['escola_alteracao'];
}