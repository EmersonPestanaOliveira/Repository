import 'package:daflor_app/controladores/controlador_App.dart';
import 'package:flutter/material.dart';

class CaixaTextoSenha_Widget extends StatefulWidget {
  @override
  _CaixaTextoSenha_WidgetState createState() => _CaixaTextoSenha_WidgetState();
}

class _CaixaTextoSenha_WidgetState extends State<CaixaTextoSenha_Widget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: "Digite a Senha",
          labelStyle: TextStyle(color: Colors.purple),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.purple,
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.purple[300],
                width: 4,
              )),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: Colors.purple,
                width: 2,
              )),
        ),
        onChanged: (String texto) {
          Controlador_App.instance.validarSenha(texto);
        },
      ),
    );
  }
}
