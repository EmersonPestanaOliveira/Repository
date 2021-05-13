import 'package:flutter/material.dart';
import 'Loading_Screen.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1 ),
          (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Loading_Screen()
         ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        color: Colors.white,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            child: Image.asset("images/logo.png"),
          ),
        ),
      ),
    );
  }
}
