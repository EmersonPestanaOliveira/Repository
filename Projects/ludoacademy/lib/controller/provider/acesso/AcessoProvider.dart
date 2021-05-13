import 'dart:async';
import 'dart:convert';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:dio/dio.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';


class AcessoProvider {
  Future<ServerResponse> login(String user, String password) async {

    var passwordBytes = Utf8Encoder().convert(password);
    FormData params = new FormData.from({'login': user, 'senha': base64.encode(passwordBytes)});

    ServerResponse _data = await HttpHelper.postCall("login", params);

    return _data;
  }
}