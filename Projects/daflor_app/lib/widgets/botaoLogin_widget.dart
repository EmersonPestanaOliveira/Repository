import 'package:daflor_app/controladores/controlador_App.dart';
import 'package:daflor_app/telas/tela_Home.dart';
import 'package:flutter/material.dart';

class BotaoLogin_Widget extends StatefulWidget {
  @override
  _BotaoLogin_WidgetState createState() => _BotaoLogin_WidgetState();
}

class _BotaoLogin_WidgetState extends State<BotaoLogin_Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child:  Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: <Color>[
              Colors.red,
              Colors.purple,
             ],
          ),
        ),
        child:  OutlineButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.red)
          ),
          color: Colors.transparent,
            onPressed: () {
              Controlador_App.instance.entrar == true
                  ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tela_Home()),
              )
                  : print("Login Inválido ");
            },
            padding: EdgeInsets.all(0.0),
            child: Text("Entrar",style: TextStyle(color:Colors.white),),
        ),
      ),
    );
  }
}
