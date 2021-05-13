import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/provider/home/blog/BlogProvider.dart';

class BlogRepository {

  final BlogProvider oProvider = new BlogProvider();

  Future<Response> postLoader() async {

    Response r = await oProvider.loadPosts();

    return r;
  }
}