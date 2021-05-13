import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/home/blog/BlogEvent.dart';
import 'package:ludo_academy/model/home/blog/BlogState.dart';
import 'package:ludo_academy/view/blocs/home/BlogBloc.dart';

import '../../DefaultError.dart';
import '../../DefaultLoading.dart';
import '../blog/BlogList.dart';
import 'BlogListEmpty.dart';

class BlogContainer extends StatefulWidget {
  @override
  State createState() {
    return new BlogWidgetState();
  }
}

class BlogWidgetState extends State<BlogContainer> {
  get oPosts => null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SafeArea(
          top: false,
          bottom: false,
          child: Container(
            color: new Color(0xFFf1f1f1),
            child: BlocBuilder<BlogEvent, BlogState>(
              bloc: BlocProvider.of<BlogBloc>(context),
              builder: (BuildContext context, BlogState state) {

                if (state is BlogUninitialized) {
                  return DefaultLoading();
                }
                if (state is BlogLoading) {
                  return DefaultLoading();
                }
                if (state is BlogEmpty) {
                  return BlogListEmpty();
                }
                if (state is BlogInitialized) {
                  return BlogList(items: state.oPosts);
                }
                if (state is BlogError) {
                  return DefaultError(sError: state.sError,);
                }
              },
            ),
          ),
        )
    );
  }
}

