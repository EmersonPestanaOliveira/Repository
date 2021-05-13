import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/controller/help/HttpHelper.dart';

class BlogProvider {
  Future<Response> loadPosts() async {

    Response _data = await HttpHelper.getBlogPosts(Application.sUrlBlogBase + Application.sUrlBlogApi, Map<String, dynamic>());

    return _data;
  }
}