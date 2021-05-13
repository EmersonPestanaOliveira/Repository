import 'package:flutter/material.dart';

class LoginSplash extends StatefulWidget {
  @override
  State<LoginSplash> createState() => _LoginSplashState();
}

class _LoginSplashState extends State<LoginSplash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: new EdgeInsets.fromLTRB(10, 10, 10, 50),
          child: new ConstrainedBox(
              constraints: new BoxConstraints(minHeight: 100.0),
              child: new DecoratedBox(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/root/LOGO.png"),
                    )),
              )
          )),
        Align (
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
            )
        )
      ],
    );
  }
}