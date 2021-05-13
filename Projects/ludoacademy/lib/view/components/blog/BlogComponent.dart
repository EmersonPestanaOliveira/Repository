import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:ludo_academy/controller/config/Application.dart';

class BlogComponent extends StatefulWidget {

  final String id;

  const BlogComponent({Key key, this.id}) : super(key: key);

  @override
  State createState() => new BlogComponentState();
}

class BlogComponentState extends State<BlogComponent> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold (
      appCacheEnabled: true,
      appBar: new AppBar(
          title: Text ("Ludo Blog")
      ),
      url: Application.sUrlBlogBase + "?p=" + widget.id,
    );
  }

}
