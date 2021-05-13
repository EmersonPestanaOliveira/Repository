class ServerResponse {
  final int success;
  final String error;
  //final List<Map<String, dynamic>> data;
  List<dynamic> data;

  final String errorMessage;

  ServerResponse(this.success, this.error, this.data, this.errorMessage);

  ServerResponse.fromJson(Map<String, dynamic> json)
  : success = json['success'],
    error = json['error'],
    data = json['data'],
    errorMessage = "";

  ServerResponse.withError(String errorValue)
  : success = -1,
    error = errorValue,
    data = List(),
    errorMessage = errorValue;

  log() {
    print ("success: " + success.toString());
    print ("error: " + error.toString());
    print ("data: " + data.toString());
  }


  /*static List<Map<String, dynamic>> parse (List<dynamic> l, String n) {
    List<Map<String, dynamic>> m = new List<Map<String, dynamic>>();

    switch (n) {
      case 'Competencia':
        l.forEach((item) {
          var m2 = <String, dynamic>{};
          m2['como_id'] = item['comp_id'];
          m2['como_nome'] = item['comp_nome'];
          m2['como_ativo'] = item['comp_ativo'];

          m.add(m2);
        });
        break;
      default:
        return List();
        break;
    }

    return m;
  }*/
}
