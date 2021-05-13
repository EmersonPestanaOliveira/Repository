import 'package:flutter/material.dart';
import 'home_screen.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2 ),
          (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Home_Screen(),
        ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Image.asset("images/magalu.png"),
            ),
            Flexible(
              flex: 1,
              child: Text("Magalu APP Inspirado!"),
            ),
            Flexible(
              flex: 1,
              child: Text("Apenas demostração para portifólio"),
            ),
            Flexible(
              flex: 1,
              child: Text("de Emerson Pestana Oliveira\n"),
            ),
            Flexible(
              flex: 1,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.height * 0.1,
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
