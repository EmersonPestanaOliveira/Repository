import 'package:ecommerce_app/screens/ShoppingCart_Screen.dart';
import 'package:flutter/material.dart';

class ProductProfile_Screen extends StatefulWidget {
  @override
  _ProductProfile_ScreenState createState() => _ProductProfile_ScreenState();
}

class _ProductProfile_ScreenState extends State<ProductProfile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 1,
                child: Image.asset("images/logo.png"),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,
                child: Text("Nome do produto"),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,
                child: Text("A partir de:"),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,
                child: Text("R\$ 99.00"),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,
                child: Text("Tipos"),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,
                child: Text("Azul"),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,
                child: RaisedButton(
                  onPressed: (){
                    print("Adicionar ao carrinho");
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ShoppingCart_Screen()
                    ),
                    );
                  },
                  child: Text("Adicionar ao carrinho"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
