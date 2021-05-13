import 'package:daflor_app/telas/tela_Arquivado.dart';
import 'package:daflor_app/telas/tela_Entregar.dart';
import 'package:daflor_app/telas/tela_Fazer.dart';
import 'package:daflor_app/telas/tela_NovoPedido.dart';
import 'package:flutter/material.dart';

class Tela_Pedidos extends StatefulWidget {
  @override
  _Tela_PedidosState createState() => _Tela_PedidosState();
}

class _Tela_PedidosState extends State<Tela_Pedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple[100],
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Image.asset("images/logo.png"),
        ),
      ),
      body: Container(
        color: Colors.purple[200],
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Novo Pedido",style: TextStyle(color:Colors.white,fontSize: MediaQuery.of(context).size.width * 0.05),),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                        icon: Icon(Icons.add),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Tela_NovoPedido()
                          ),
                          );
                        }),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print("Fazer");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tela_Fazer()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Card(
                      color: Colors.purple[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.purple,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Text(
                              "Fazer",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.08,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Icon(
                              Icons.label,
                              color: Colors.purple,
                              size: MediaQuery.of(context).size.height * 0.1,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Entregar");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tela_Entregar()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Card(
                      color: Colors.purple[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.purple,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Text(
                              "Entregar",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.08,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Icon(
                              Icons.airport_shuttle_outlined,
                              color: Colors.purple,
                              size: MediaQuery.of(context).size.height * 0.1,
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Arquivado");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tela_Arquivado()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Card(
                      color: Colors.purple[100],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.purple,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Text(
                              "Arquivado",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.08,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Icon(
                              Icons.archive,
                              color: Colors.purple,
                              size: MediaQuery.of(context).size.height * 0.1,
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
    );
  }
}
