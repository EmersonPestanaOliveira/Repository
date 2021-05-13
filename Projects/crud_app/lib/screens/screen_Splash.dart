import 'package:crudapp/screens/screen_Home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ScreenSplash extends StatefulWidget {
  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScreenHome()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF3862F5),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
            ),
            Flexible(
              flex: 2,
              child: ImageLogo(),
            ),
            Flexible(
              flex: 1,
              child: TextAutor(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageLogo extends StatefulWidget {
  @override
  _ImageLogoState createState() => _ImageLogoState();
}

class _ImageLogoState extends State<ImageLogo> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Image(
        image: AssetImage(
          'images/logo.png',
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}

class TextAutor extends StatefulWidget {
  @override
  _TextAutorState createState() => _TextAutorState();
}

class _TextAutorState extends State<TextAutor> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 2,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              "Emerson Pestana Oliveira",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
