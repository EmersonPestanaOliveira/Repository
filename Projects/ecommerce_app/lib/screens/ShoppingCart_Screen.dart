import 'package:flutter/material.dart';

class ShoppingCart_Screen extends StatefulWidget {
  @override
  _ShoppingCart_ScreenState createState() => _ShoppingCart_ScreenState();
}

class _ShoppingCart_ScreenState extends State<ShoppingCart_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho"),
      ),
    );
  }
}
