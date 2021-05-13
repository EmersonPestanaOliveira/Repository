class DadosUsuario {
  final int competencia;
  final int pontuacao;

  DadosUsuario(this.competencia, this.pontuacao);

  DadosUsuario.fromJson(dynamic json)
      : competencia = int.parse(json['competencia']),
        pontuacao = int.parse(json["pontuacao"]);
}