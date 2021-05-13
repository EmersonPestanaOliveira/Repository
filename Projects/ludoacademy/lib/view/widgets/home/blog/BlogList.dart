import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/blog/BlogPost.dart';
import 'package:flutter_html/flutter_html.dart';

class BlogList extends StatelessWidget {

  final List<BlogPost> items;

  BlogList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            //return Text(items[index].nome.toUpperCase());
            return InkWell(
              onTap: () {
                Application.oRouter.navigateTo(
                    context,
                    '/blog/' + items[index].id.toString(),
                    transition:
                    TransitionType
                        .nativeModal)
                    .then((result) {
                  print(result);
                });
              },
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: new Color(0xFFFFFFFF)
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: new Color(0xFFFFFFFF)
                      //gradient: AppTheme.partidaDefault
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8),
                      title: Column (
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(items[index].title.toUpperCase(), style: AppTheme.tsBlogPostTitle),
                          Text(items[index].title.toUpperCase(), style: AppTheme.tsDefaultBoldTextStyle2),
                        ],
                      ),
                      subtitle: Html(
                        data: items[index].description,
                        defaultTextStyle: AppTheme.tsDefaultTextStyle2,
                      ),

                      trailing: SizedBox(
                        width: 100,
                        height: 100,
                        child: (items[index].img != "")?Center(child: CircularProgressIndicator()):FadeInImage.assetNetwork(
                          placeholder: 'assets/images/spinningwheel.gif',
                          image: items[index].img,
                          alignment: Alignment.center,
                        )
                      )

                    ),
                  )
              ),
            );
          })
  );
}