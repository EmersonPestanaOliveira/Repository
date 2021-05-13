import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/server/ServerResponse.dart';

class HttpHelper {

    static Response response;
    static final Dio dio = new Dio( new BaseOptions(
      receiveTimeout: 10000,
      connectTimeout: 10000,
      baseUrl: Application.sUrlApi,
      headers: {
        "authorization": Application.sBasicAuth,
        "accept":"application/json"
      },
    ));
    static final Dio dioBlog = new Dio(
      new BaseOptions (
        receiveTimeout: 10000,
        connectTimeout: 10000,
        headers: {
          "accept":"application/json"
        }
      )
    );

    HttpHelper();

    // Blog call
    static Future<Response> getBlogPosts(String path, Map<String, dynamic> params) async {
      try {
        Response response = await dioBlog.get(path, queryParameters: params, options: new Options(contentType:ContentType.parse("application/x-www-form-urlencoded")));
        return response;
      }
      catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return new Response();
      }
    }

    static Future<ServerResponse> getCall(String path, Map<String, dynamic> params) async {
      try {
        Response response = await dio.get(path, queryParameters: params);
        Map<String, dynamic> l = jsonDecode(response.data.toString());
        return ServerResponse.fromJson(l);
      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return ServerResponse.withError("Erro na conexão, tente novamente");
      }
    }

    static Future<ServerResponse> postCall(String path, FormData params) async {
      try {
        Response response = await dio.post(path, data: params);
        print(response.toString());
        Map<String, dynamic> l = jsonDecode(response.data.toString());
        return ServerResponse.fromJson(l);

      } catch (error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        return ServerResponse.withError("Erro na conexão, tente novamente");
      }
    }

    // TODO postCall, putCall, deleteCall
}