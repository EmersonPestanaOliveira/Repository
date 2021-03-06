import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daflor_app/telas/tela_Pedidos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Tela_Fazer extends StatefulWidget {
  @override
  _Tela_FazerState createState() => _Tela_FazerState();
}

class _Tela_FazerState extends State<Tela_Fazer> {

var carregarPedidos = FirebaseFirestore.instance.collection("pedidos") .where("status", isEqualTo: "fazer").snapshots();



@override
  void initState() {
  Firebase.initializeApp();
    // TODO: implement initState
    super.initState();
  }

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
        color: Colors.purple[300],
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 1,
                      child: Column(
                          children: [
                            Expanded(
                              child:Container(
                                child: StreamBuilder(
                                  stream: carregarPedidos,
                                  builder: (ctx, snapshot) {
                                    if (!snapshot.hasData)
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    print(snapshot.data.documents.length);

                                    return ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: snapshot.data.documents.length,
                                        itemBuilder: (context, index) => SingleChildScrollView(
                                          child: Dismissible(
                                            key: UniqueKey(),
                                            onDismissed: (direction){

                                              showAlertDialogDeletar(BuildContext context) {
                                                Widget cancelaButton = FlatButton(
                                                  child: Text("Cancelar"),
                                                  onPressed:  () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                );
                                                Widget continuaButton = FlatButton(
                                                  child: Text("Deletar"),
                                                  onPressed:  () {
                                                    print(snapshot.data.documents[index].id);

                                                    FirebaseFirestore.instance.collection("pedidos")
                                                        .doc(snapshot.data.documents[index].id)
                                                        .delete();
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                );
                                                //configura o AlertDialog
                                                AlertDialog alert = AlertDialog(
                                                  title: Text("Pedido"),
                                                  content: Text("Deseja deletar esse Pedido?"),
                                                  actions: [
                                                    cancelaButton,
                                                    continuaButton,
                                                  ],
                                                );
                                                //exibe o di??logo
                                                showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return alert;
                                                  },
                                                );
                                              }

                                              showAlertDialogDeletar(context);

                                            },
                                            child: Card(
                                              color: Colors.pink[100],
                                              child: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  physics: AlwaysScrollableScrollPhysics(),
                                                  child: Column(
                                                    children: [
                                                      Text("Status: ${snapshot.data.documents[index]['status']}"
                                                      ),
                                                      Text("Data do pedido: ${snapshot.data.documents[index]['diaPedido']}"
                                                      ),
                                                      Text("Nome Cliente: ${snapshot.data.documents[index]['nomeCliente']}"
                                                      ),
                                                      Text("Produtos : ${snapshot.data.documents[index]['produtos']}"
                                                      ),
                                                      Text("Valor : R\$${snapshot.data.documents[index]['valorpedido'].toString()}"
                                                      ),
                                                      RaisedButton(
                                                          onPressed: (){

                                                            showAlertDialogEntregar(BuildContext context) {
                                                              Widget cancelaButton = FlatButton(
                                                                child: Text("Cancelar"),
                                                                onPressed:  () {
                                                                  Navigator.pop(context);
                                                                },
                                                              );
                                                              Widget continuaButton = FlatButton(
                                                                child: Text("Mandar para Entrega"),
                                                                onPressed:  () {
                                                                  print(snapshot.data.documents[index].id);

                                                                  FirebaseFirestore.instance.collection("pedidos")
                                                                      .doc(snapshot.data.documents[index].id)
                                                                      .update({
                                                                    "status":"entregar",
                                                                  });
                                                                  Navigator.pop(context);
                                                                },
                                                              );
                                                              //configura o AlertDialog
                                                              AlertDialog alert = AlertDialog(
                                                                title: Text("Pedido"),
                                                                content: Text("Deseja Mandar Para entrega ?"),
                                                                actions: [
                                                                  cancelaButton,
                                                                  continuaButton,
                                                                ],
                                                              );
                                                              //exibe o di??logo
                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return alert;
                                                                },
                                                              );
                                                            }

                                                            showAlertDialogEntregar(context);


                                                          },
                                                        child: Text("Enviar para entrega"),
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            ),
                                          )
                                        ));
                                  },
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
