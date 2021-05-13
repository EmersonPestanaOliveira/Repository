class Notificacao {
  final int id;
  final String msg;
  final String link;
  final int ativo;
  final String data;

  Notificacao(this.id, this.msg, this.link, this.ativo, this.data);

  Notificacao.fromJson(dynamic json)
      : id = int.parse(json['notificacao_id']),
        msg = json["notificacao_msg"],
        link = json["notificacao_link"],
        ativo = int.parse(json["notificacao_ativo"]),
        data = json["notificacao_data"];
}