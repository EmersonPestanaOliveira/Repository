import 'package:flutter/cupertino.dart';

class Controlador_App extends ChangeNotifier{

  static Controlador_App instance = Controlador_App();

  String senha = "charlies2" ;
  bool entrar = false;

  validarSenha(String texto){

    if(texto == senha){
      entrar = true;
      notifyListeners();
    }else{

    }

  }

}

