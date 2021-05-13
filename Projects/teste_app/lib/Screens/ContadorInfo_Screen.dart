import 'package:flutter/material.dart';
import 'package:teste_app/Controllers/App_Controller.dart';

class ContadorInfo_Screen extends StatefulWidget {
  @override
  _ContadorInfo_ScreenState createState() => _ContadorInfo_ScreenState();
}

class _ContadorInfo_ScreenState extends State<ContadorInfo_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador está em ${AppController.instance.contador}"),
      ),
    );
  }
}
