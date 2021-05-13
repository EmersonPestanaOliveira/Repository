import 'package:flutter/material.dart';

class MenuPedidosNaoPagos_Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          colors: <Color>[
            Colors.red[100],
            Colors.purple[100],
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.red[400],
                  Colors.purple[400],
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: EdgeInsets.all(10),
            child: Text("Pedidos não pagos",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height * 0.05,),),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.15,
            child:  Icon(Icons.money_off,color: Colors.purple,size: MediaQuery.of(context).size.height * 0.1,),
          ),
        ],
      ),
    );
  }
}
