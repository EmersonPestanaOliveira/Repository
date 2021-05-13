import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';

class AlunosListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("SELECIONE A TURMA",
          style: TextStyle(
              color: AppTheme.cDefaultTextColor2,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: AppTheme.fDefaultTextFont
          )),
    );
  }
}