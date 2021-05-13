import 'package:daflor_app/telas/tela_Login.dart';
import 'package:flutter/material.dart';

class Tela_Splash extends StatefulWidget {
  @override
  _Tela_SplashState createState() => _Tela_SplashState();
}

class _Tela_SplashState extends State<Tela_Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2 ),
          (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Tela_Login()
        ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Center(
          child: Image.asset("images/logo.png"),
        ),
      ),
    );
  }
}
