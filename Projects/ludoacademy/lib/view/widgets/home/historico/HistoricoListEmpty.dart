import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';

class HistoricoListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: Text("SEM PARTIDAS",
    style: TextStyle(
      color: AppTheme.cDefaultTextColor2,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontFamily: AppTheme.fDefaultTextFont
    )),
  );
}