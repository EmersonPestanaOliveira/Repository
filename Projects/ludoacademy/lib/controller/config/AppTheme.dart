import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AppTheme {
  static Color cDefaultBackground = new Color(0xFF00D6F7);
  static Color cDefaultButtonBackground = new Color(0xFF00b4ff);

  static Color cDefaultLabelColor = new Color(0xFFBBBBBB);
  static Color cDefaultLabelColorSelected = new Color(0xFF06a4e7);

  static Color cDefaultTextColor = Colors.white;
  static Color cDefaultTextColor2 = new Color(0xFF00b4ff);
  static Color cDefaultTextColor3 = new Color(0xFF000000);
  static Color cDefaultTextColor4 = new Color(0xFF555555);

  static String fDefaultTextFont = "montserrat";
  static String fDefaultTitleFont = "loyola pro";

  // Temas texto
  static TextStyle tsDefaultTextStyle = new TextStyle(
    color: Colors.white,
    fontFamily: fDefaultTextFont,
    fontSize: 12
  );
  static TextStyle tsDefaultTextStyle14 = new TextStyle(
      color: Colors.white,
      fontFamily: fDefaultTextFont,
      fontSize: 14
  );
  static TextStyle tsDefaultTextStyle2 = new TextStyle(
      color: Colors.black,
      fontFamily: fDefaultTextFont,
      fontSize: 12
  );
  static TextStyle tsDefaultBoldTextStyle = new TextStyle(
      color: Colors.white,
      fontFamily: fDefaultTextFont,
      fontSize: 12,
      fontWeight: FontWeight.bold
  );
  static TextStyle tsDefaultBoldTextStyle18 = new TextStyle(
      color: Colors.white,
      fontFamily: fDefaultTextFont,
      fontSize: 18,
      fontWeight: FontWeight.bold
  );
  static TextStyle tsDefaultBoldTextStyle2 = new TextStyle(
      color: Colors.black,
      fontFamily: fDefaultTextFont,
      fontSize: 12,
      fontWeight: FontWeight.bold
  );
  static TextStyle tsDefaultBoldTextStyle3 = new TextStyle(
      color: cDefaultTextColor2,
      fontFamily: fDefaultTextFont,
      fontSize: 12,
      fontWeight: FontWeight.bold
  );

  static TextStyle tsBlogPostTitle = new TextStyle(
      color: Colors.black,
      fontFamily: fDefaultTextFont,
      fontSize: 20,
      fontWeight: FontWeight.bold
  );

  static TextStyle tsDropDownAlunos = new TextStyle(
    backgroundColor: Colors.white,
      color: cDefaultLabelColorSelected,
      fontFamily: fDefaultTextFont,
      fontSize: 12,
      fontWeight: FontWeight.bold
  );

  // Fontes
  static Color getMesaColor(int id) {
    if (id < 0) {
      return new Color(0xFFFF0000);
    }

    //print ("id mesa: " + id.toString());
    List<Color> lColors = new List<Color>();
    lColors = [new Color(0xFFFF0000), new Color(0xFF00FF00), new Color(0xFF0000FF), new Color(0xFFFF0000),
      new Color(0xFFFF0000), new Color(0xFFFF0000), new Color(0xFFFF0000), new Color(0xFFFF0000),
      new Color(0xFFFF0000), new Color(0xFFFF0000), new Color(0xFFFF0000), new Color(0xFFFF0000),
      new Color(0xFFFF0000), new Color(0xFFFF0000), new Color(0xFFFF0000), new Color(0xFFFF0000)];

    return lColors[id];
  }

  // Alertas
  static AlertStyle alertaStyle = new AlertStyle(
      isCloseButton: false,
      titleStyle: TextStyle(
          color: AppTheme.cDefaultTextColor2, fontSize: 15, fontFamily: AppTheme.fDefaultTextFont, fontWeight: FontWeight.bold),
      descStyle: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: AppTheme.fDefaultTextFont),
      buttonAreaPadding: EdgeInsets.fromLTRB(20, 80, 20, 20),
      alertBorder: Border.all(
          style: BorderStyle.solid
      )
  );

  static TextStyle botaoSim = TextStyle(
      color: Colors.white, fontSize: 12, fontFamily: AppTheme.fDefaultTextFont, fontWeight: FontWeight.bold);

  static TextStyle botaoNao = TextStyle(
      color: Colors.white, fontSize: 12, fontFamily: AppTheme.fDefaultTextFont, fontWeight: FontWeight.bold);

}
