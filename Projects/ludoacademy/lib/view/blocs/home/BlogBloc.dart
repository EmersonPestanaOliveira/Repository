


import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ludo_academy/controller/repository/home/blog/BlogRepository.dart';
import 'package:ludo_academy/model/blog/BlogPost.dart';
import 'package:ludo_academy/model/home/blog/BlogEvent.dart';
import 'package:ludo_academy/model/home/blog/BlogState.dart';
import 'package:meta/meta.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository oBlogRepository;

  BlogBloc({
    @required this.oBlogRepository
  })  : assert(BlogRepository != null);

  BlogState get initialState => BlogUninitialized();

  @override
  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    if (event is BlogLoad) {
      yield BlogLoading();

      try {
        Response r = await oBlogRepository.postLoader();
        List<BlogPost> oPosts = new List<BlogPost>();

        if (r.data != null && r.data.length > 0) {
          for (var i = 0; i < r.data.length; i++) {

            //print (r.data[i]);
            //print ("data: " + r.data[i]);

            int id = r.data[i]['id'];
            String title = r.data[i]['title']['rendered'];
            String content = r.data[i]['excerpt']['rendered'];
            String link = r.data[i]['link'];
            //String img = r.data[i]['_embedded']['wp:featuredmedia'][0]['source_url'];

            String img = "";

            try {
              img = r.data[i]['_embedded']['wp:featuredmedia'][0]['source_url'];
            }
            catch (error) {
              img = "";
            }

            BlogPost p = new BlogPost(id, title, content, link, img);

            oPosts.add(p);
          }
        }

        if (oPosts.length > 0) {
          yield BlogInitialized(oPosts: oPosts);
        }
        else {
          yield BlogEmpty();
        }
      }
      catch(error) {
        print ("error: " + error.toString());
        yield BlogError(sError: error.toString());
      }
    }
  }
}