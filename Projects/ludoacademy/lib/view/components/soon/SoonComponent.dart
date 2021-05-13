import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';

class SoonComponent extends StatefulWidget {
  @override
  State createState() => new SoonStateComponent();
}

class SoonStateComponent extends State<SoonComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EM BREVE"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("EM BREVE",
        style: AppTheme.tsDefaultBoldTextStyle3)
      )
    );
  }
}