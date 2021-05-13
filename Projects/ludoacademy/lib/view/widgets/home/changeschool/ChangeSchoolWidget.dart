import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/home/changeschool/ChangeSchoolEvent.dart';
import 'package:ludo_academy/model/home/changeschool/ChangeSchoolState.dart';
import 'package:ludo_academy/view/blocs/home/ChangeSchoolBloc.dart';
import 'package:ludo_academy/view/widgets/DefaultError.dart';
import 'package:ludo_academy/view/widgets/DefaultLoading.dart';
import 'package:ludo_academy/view/widgets/home/changeschool/ChangeSchoolList.dart';


class ChangeSchoolWidget extends StatefulWidget {

  @override
  State createState() {
    return new ChangeSchoolWidgetState();
  }
}

class ChangeSchoolWidgetState extends State<ChangeSchoolWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            SafeArea(
              top: false,
              bottom: false,
              child: Container(
                color: new Color(0xFFf1f1f1),
                child: BlocBuilder<ChangeSchoolEvent, ChangeSchoolState>(
                  bloc: BlocProvider.of<ChangeSchoolBloc>(context),
                  builder: (BuildContext context, ChangeSchoolState state) {
                    if (state is ChangeSchoolLoading) {
                      return DefaultLoading();
                    }
                    if (state is ChangeSchoolEmpty) {
                      return DefaultLoading();
                    }
                    if (state is ChangeSchoolUninitialized) {
                      return DefaultLoading();
                    }
                    if (state is ChangeSchoolInitialized) {
                      return ChangeSchoolList(items: state.oEscolas
                      );
                    }
                    if (state is ChangeSchoolError) {
                      return DefaultError(sError: state.sError);
                    }
                  },
                ),
              ),
            )
    );
  }
}