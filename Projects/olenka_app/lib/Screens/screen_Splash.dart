import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olenka_app/Screens/screen_Home.dart';

class Screen_Splash extends StatefulWidget {
  @override
  _Screen_SplashState createState() => _Screen_SplashState();
}

class _Screen_SplashState extends State<Screen_Splash> {
  double valorLoading = 0;
  double tamanhoLoading = 0.03;

  void loading() async {
    const tempoDelay = Duration(milliseconds: 5);

    Timer.periodic(tempoDelay, (Timer t) {
      print(valorLoading);
      setState(() {
        valorLoading += 0.01;
        if (valorLoading >= 1) {
          t.cancel();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Screen_Home()),
          );
        }
      });
    });
  }

  /*Future.delayed(
     Duration(seconds: 2),
         () {
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => Screen_Home()),
       );
     },
   );*/

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 1,
                        width: MediaQuery.of(context).size.width * 1,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Padding(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.01),
                              child: Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    child: CircularProgressIndicator(
                                      value: valorLoading,
                                      strokeWidth:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Color(0xFF001e64)),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),

                                  Positioned.fill(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.05),
                                      child: Image.asset("images/logoAzul.png"),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
