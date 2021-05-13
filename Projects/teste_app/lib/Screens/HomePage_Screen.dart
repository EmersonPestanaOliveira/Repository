import 'package:flutter/material.dart';
import 'package:teste_app/Controllers/App_Controller.dart';
import 'package:teste_app/Screens/ContadorInfo_Screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          IconButton(icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContadorInfo_Screen()),
                );
              }
              ),
        ],
      ),
      body: AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return Container(
            child: Center(
              child: Text("Contador: ${AppController.instance.contador}"),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppController.instance.addContador();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
