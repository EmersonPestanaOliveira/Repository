import 'package:flutter/material.dart';

class TextoVersao_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.001),
      child: Text("Versão Beta(testes) Versão 1.0.0"),
    );
  }
}
