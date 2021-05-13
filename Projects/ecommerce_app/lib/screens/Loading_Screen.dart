import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home_Screen.dart';

class Loading_Screen extends StatefulWidget {
  @override
  _Loading_ScreenState createState() => _Loading_ScreenState();
}

class _Loading_ScreenState extends State<Loading_Screen> {

  double _progress = 0;
  double _loading = 0;

  void startTimer() {
    Timer.periodic(
      Duration(milliseconds: 200),
          (Timer timer) => setState(
            () {
          if (_progress == 1) {
            timer.cancel();
          } else {
            _progress += 0.1;
            _loading = _progress * 100;
            if ( _loading > 99){
              _loading = 100;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home_Screen()
                  ));
              timer.cancel();
            }
          }
        },
      ),
    );
  }

  @override
  void initState() {
    print("iniciou");
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Image.asset("images/logo.png"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
            Flexible(
              flex: 1,
              child: LinearProgressIndicator(
                backgroundColor: Colors.cyanAccent,
                valueColor:  AlwaysStoppedAnimation<Color>(Colors.red),
                value: _progress,
                minHeight: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
            Flexible(
              flex: 1,
              child: Text("${_loading.toStringAsPrecision(3)} %")
            ),
          ],
        ),
      ),
    );
  }
}
