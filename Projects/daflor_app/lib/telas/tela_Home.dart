import 'package:daflor_app/telas/tela_Pedidos.dart';
import 'package:daflor_app/telas/tela_PedidosNaoPagos.dart';
import 'package:daflor_app/telas/tela_PedidosPagos.dart';
import 'package:daflor_app/widgets/logo_widget.dart';
import 'package:daflor_app/widgets/menuPedidosNaoPagos_widget.dart';
import 'package:daflor_app/widgets/menuPedidosPagos_widget.dart';
import 'package:daflor_app/widgets/menuPedidos_widget.dart';
import 'package:flutter/material.dart';

class Tela_Home extends StatefulWidget {
  @override
  _Tela_HomeState createState() => _Tela_HomeState();
}

class _Tela_HomeState extends State<Tela_Home> {
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
          child:  Logo_Widget(),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/backgroundHome.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              GestureDetector(
                onTap: () {
                  print("pedidos");
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Tela_Pedidos()
                  ),
                  );
                },
                child: MenuPedidos_Widget(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              GestureDetector(
                onTap: () {
                  print("pedidos");
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Tela_PedidosNaoPagos()
                  ),
                  );
                },
                child: MenuPedidosNaoPagos_Widget(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              GestureDetector(
                onTap: () {
                  print("pedidos");
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Tela_PedidosPagos()
                  ),
                  );
                },
                child: MenuPedidosPagos_Widget(),
              ),

            ],
          ),
        )
      ),
    );
  }
}
