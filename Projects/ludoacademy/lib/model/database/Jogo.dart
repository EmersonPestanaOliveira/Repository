class Jogo {
  final int id;
  final String nome;
  final int jogoEnsinoId;
  final int jogMin;
  final int jogMax;
  final String manual;
  final String video;
  final int ativo;
  final String logo;
  final String cor;
  final String data;
  final int tempo;
  final int idade;
  final String componentes;
  final String caixa;
  final int perfil;

  Jogo(this.id, this.nome, this.jogoEnsinoId, this.jogMin, this.jogMax, this.manual, this.video, this.ativo, this.logo, this.cor, this.data, this.tempo, this.idade, this.componentes, this.caixa, this.perfil);

  Jogo.fromJson(dynamic json)
  : id = int.parse(json['jogo_id']),
    nome = json['jogo_nome'],
    jogoEnsinoId = int.parse(json['jogo_ensino_id']),
    jogMin = int.parse(json['jogo_jog_min']),
    jogMax = int.parse(json['jogo_jog_max']),
    manual = json['jogo_manual'],
    video = json['jogo_video'],
    ativo = int.parse(json['jogo_ativo']),
    logo = json['jogo_logo'],
    cor = json['jogo_cor'],
    data = json['jogo_data'],
    tempo = int.parse(json['jogo_tempo']),
    idade = int.parse(json['jogo_idade']),
    componentes = json['jogo_componentes'],
    caixa = json['jogo_caixa'],
    perfil = int.parse(json['jogo_perfil']);
}