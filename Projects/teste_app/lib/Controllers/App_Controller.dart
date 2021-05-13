import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier{

  static AppController instance = AppController();

  int contador = 0;

  addContador(){
    contador++;
    notifyListeners();
  }

}