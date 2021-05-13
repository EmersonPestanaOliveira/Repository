import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/home/changeschool/ChangeSchoolEvent.dart';
import 'package:ludo_academy/view/blocs/home/ChangeSchoolBloc.dart';
import 'package:ludo_academy/view/widgets/home/changeschool/ChangeSchoolWidget.dart';

class ChangeSchoolComponent extends StatefulWidget {

  final int id;

  const ChangeSchoolComponent({Key key, this.id}) : super(key: key);

  @override
  State createState() => new ChangeSchoolStateComponent();
}

class ChangeSchoolStateComponent extends State<ChangeSchoolComponent>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Text("SELECIONE SUA ESCOLA",
            style: TextStyle(
              color: AppTheme.cDefaultTextColor2,
              fontFamily: AppTheme.fDefaultTextFont,
              fontSize: 16,
              fontWeight: FontWeight.bold
            )),
          centerTitle: true,
          leading: InkWell(
            child: Icon(Icons.arrow_back_ios, color: AppTheme.cDefaultTextColor2),
            onTap: () {
              Application.oRouter.pop(context);
            },
          ),
          backgroundColor: new Color(0xFFf1f1f1),
          elevation: 0,
        ),
        resizeToAvoidBottomPadding: false,
        body: BlocProvider<ChangeSchoolBloc>(
            builder: (context) {
              return ChangeSchoolBloc(oChangeSchoolRepository: Application.oRepositoryChangeSchool)..dispatch(ChangeSchoolLoad(widget.id));
            },
            child: ChangeSchoolWidget()
        ));
  }

}