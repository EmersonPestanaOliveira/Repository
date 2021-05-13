import 'package:daflor_app/controladores/controlador_App.dart';
import 'package:daflor_app/telas/tela_Home.dart';
import 'package:daflor_app/widgets/botaoLogin_widget.dart';
import 'package:daflor_app/widgets/caixaTextoSenha_widget.dart';
import 'package:daflor_app/widgets/logo_widget.dart';
import 'package:daflor_app/widgets/textoVersao_widget.dart';
import 'package:flutter/material.dart';

class Tela_Login extends StatefulWidget {
  @override
  _Tela_LoginState createState() => _Tela_LoginState();
}

class _Tela_LoginState extends State<Tela_Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Logo_Widget(),
                TextoVersao_Widget(),
                CaixaTextoSenha_Widget(),
                BotaoLogin_Widget(),
              ],
            ),
          ),
      ),
    );
  }
}
