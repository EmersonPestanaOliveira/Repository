import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[700],
              borderRadius: BorderRadius.all(
                  Radius.circular(30.0) //                 <--- border radius here
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Procure no magalu",
                hintStyle: TextStyle(color: Colors.white),
                border:  InputBorder.none,
                prefixIcon: Icon(Icons.search,color: Colors.white,size: 30,),
              ),
              onTap: (){
                print("Pesquisa");
              },
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: [
            Flexible(
              flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
                      colors: [ Colors.yellow,Colors.pink,Colors.blue,Colors.lightGreenAccent], // red to yellow
                      // repeats the gradient over the canvas
                    ),
                  ),
                )
            ),
            Flexible(
                flex: 100,
                child: Container(
                  color: Colors.blue,
                )
            )
          ],
        ),
      ),
    );
  }
}
