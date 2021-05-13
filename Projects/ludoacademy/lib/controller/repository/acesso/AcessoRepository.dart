import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/help/HttpHelper.dart';
import 'package:ludo_academy/model/database/Acesso.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcessoRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {

    final prefs = await SharedPreferences.getInstance();

    var passwordBytes = Utf8Encoder().convert(password);
    FormData params = new FormData.from( {'login': username, 'senha': base64.encode(passwordBytes)});

    ServerResponse r = await HttpHelper.postCall("login", params);

    print (r.success);
    print (r.data);

    if (r.success == 1) {

      print (r.data[0]);

      Application.oProfile = Acesso.fromJson(r.data);
      print ("usuarioid: " + Application.oProfile.usuarioId.toString());

      prefs.setBool("login", true);
      prefs.setString("user", username);
      prefs.setString("password", password);

      return '1';
    }

    prefs.setBool("login", false);
    prefs.setString("user", "");
    prefs.setString("password", "");

    return '0';
  }

  Future<void> deleteToken() async {

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("login", false);
    prefs.setString("user", "");
    prefs.setString("password", "");

    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {

    final prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds: 1));

    if (!prefs.containsKey("login")) {
      return false;
    }

    if (prefs.getBool("login")) {

      String username = prefs.getString("user");
      String password = prefs.getString("password");

      var passwordBytes = Utf8Encoder().convert(password);
      FormData params = new FormData.from( {'login': username, 'senha': base64.encode(passwordBytes)});

      ServerResponse r = await HttpHelper.postCall("login", params);

      if (r.success == 1) {

        Application.oProfile = Acesso.fromJson(r.data);

        return true;
      }


      return false;
    }
    else {
      return false;
    }
  }
}