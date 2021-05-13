import 'package:ecommerce_app/screens/ProductProfile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Loja"),
        actions: [
          GestureDetector(
            onTap: (){
              print("carrinho");
            },
            child: Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: Container(
        color: Colors.blue[100],
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Promoções do dia"),
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 1,
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) =>  Container(
                      color: Colors.green,
                      child: GestureDetector(
                        onTap: (){
                          print('$index');
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ProductProfile_Screen()
                          ),
                          );
                        },
                        child: Container(
                          color: Colors.green,
                          child: Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text('$index'),
                            ),
                          ),
                        ),
                      ),),
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 2 : 1),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
