import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daflor_app/telas/tela_Fazer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tela_NovoPedido extends StatefulWidget {
  @override
  _Tela_NovoPedidoState createState() => _Tela_NovoPedidoState();
}

class _Tela_NovoPedidoState extends State<Tela_NovoPedido> {



  var _controllerNome = TextEditingController();
  var _controllerQuantidade = TextEditingController();

  var nomeCliente = " ";
  var quantidade = " ";

  double valorProduto ;
  double valorTotal ;
  double valorPedido ;
  bool pagamento = false;


  var valoresPedido = [];

  var _itemSelecionadoTipoProduto = ' ';

  void _dropDownItemSelectedTipoProduto(String novoItem) {
    setState(() {
      _itemSelecionadoTipoProduto = novoItem;
    });
  }

  var _itemSelecionadoEssencias = ' ';

  void _dropDownItemSelectedEssencias(String novoItem) {
    setState(() {
      _itemSelecionadoEssencias = novoItem;
    });
  }

  var _tipoProduto = [
    ' ',
    'Difusor de Ambiente 100 ml',
    'Difusor de Ambiente 250 ml',
    'Difusor de Carro 10 ml',
    'Spray anti ansiedade e insônia 60 ml',
    'Velas aromáticas no Pote',
    'Velas Pacote com 5 unidades',
    'Velas Pacote Rosas com 5 unidades',
    'Velas Avulso',
    'Sabonetes Artesanais Grande',
    'Sabonetes Artesanais Médio',
    'Sabonetes Artesanais Pequeno',
    'Mini sabonetes com 10 unid.',
    'Sabonetes Hidratante Aveia',
    'Sabonete anti cravo e espinhas',
    'Sabonetes Linha Fruit',
  ];

  var _essencias = [
    ' ',
    '************* DIFUSORES ',
    'Lavanda',
    'Jasmim Frutal',
    'Jasmim',
    'Uva verde',
    'Maracujá',
    'Canela',
    'Melancia',
    'Love Spell',
    'Tangerina',
    'Pitanga',
    'Capim Limão',
    'Alecrim',
    'Flor de cerejeira',
    'Any Any',
    'Rosa de Marrocos',
    'Cascas e folhas',
    'Baby talco',
    'Mamãe Bebê',
    'Lírio Branco,',
    'Lírio Branco Chic',
    'Sete ervas',
    'Bamboo MM',
    '************* SPRAY ANTI ANSIEDADE ',
    'Única- Blend de óleos essenciais ervas',
    '************* VELAS ',
    'Canela.',
    'Citronela.',
    'Flor de laranjeira.',
    'Flor de cerejeira.',
    'Jasmim.',
    'Lavanda.',
    '************* SABONETES ',
    'Lavanda,',
    'Maracujá,',
    'Canela,',
    'Melancia,',
    'Limão,',
    'Alecrim,',
    'Cereja,',
    'Rosas,',
    'Laranja,',
    'Pitanga,',
    'Vetiver,',
    'Melaleuca,',
    'Sementes do Brasil,',
    'Cravo,',
    'Gerânio,',
    'Hortelã,',
    'Morango,',
    'Erva doce,',
    'Banana,',
    'Frutas exóticas,',
    'Coco com menta,',
    'Prosperidade,',
  ];

  var _pedido = [];



  void adicionarPedido(String produtos) async {
    await Firebase.initializeApp();

    DateTime now = DateTime.now();
    String horaPedido = DateFormat(' kk:mm:ss').format(now);
    String diaPedido = DateFormat('d MMM yyyy').format(now);
    print("hora: $horaPedido , dia: $diaPedido");

    FirebaseFirestore.instance.collection("pedidos")
        .add({
      "produtos":produtos,
      "horaPedido":horaPedido,
      "diaPedido":diaPedido,
      "nomeCliente":nomeCliente,
      "status":"fazer",
      "valorpedido":valorPedido,
      "pagamento":false,
    });
  }

  @override
  void initState() {
    valorPedido = 0;
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
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Text(
                    "Escreva o nome do cliente",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.085,
                    child: TextField(
                      controller: _controllerNome,
                      onChanged: (String texto){
                        setState(() {
                          nomeCliente = texto;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome do Cliente',
                      ),
                    ),
                  ),
                  Text(
                    "Selecione o tipo do produto:",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        items: _tipoProduto.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (String novoItemSelecionado) {
                          _dropDownItemSelectedTipoProduto(novoItemSelecionado);
                          setState(() {
                            this._itemSelecionadoTipoProduto =
                                novoItemSelecionado;
                          });
                        },
                        value: _itemSelecionadoTipoProduto),
                  ),
//
                  Text(
                    "Selecione a Essência:",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.09,
                    child: DropdownButton<String>(
                        dropdownColor: Colors.white,
                        items: _essencias.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                        onChanged: (String novoItemSelecionado) {
                          _dropDownItemSelectedEssencias(novoItemSelecionado);
                          setState(() {
                            this._itemSelecionadoEssencias =
                                novoItemSelecionado;
                          });
                        },
                        value: _itemSelecionadoEssencias),
                  ),
                  Text(
                    "Quantidade do produto",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.085,
                    child: TextField(
                      controller: _controllerQuantidade,
                      keyboardType: TextInputType.number,
                      onChanged: (String texto){
                        setState(() {
                          quantidade = texto;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'unidades do produto',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Adicionar Produto",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            switch(_itemSelecionadoTipoProduto) {
                              case "Difusor de Ambiente 100 ml": {
                                valorProduto = 20.00;
                              }
                              break;

                              case "Difusor de Ambiente 250 ml": {
                                valorProduto = 45.00;
                              }
                              break;

                              case "Difusor de Carro 10 ml": {
                                valorProduto = 8.00;
                              }
                              break;

                              case "Spray anti ansiedade e insônia 60 ml": {
                                valorProduto = 9.00;
                              }
                              break;

                              case "Velas aromáticas no Pote": {
                                valorProduto = 35.00;
                              }
                              break;

                              case "Velas Pacote com 5 unidades": {
                                valorProduto = 12.50;
                              }
                              break;

                              case "Velas Pacote Rosas com 5 unidades": {
                                valorProduto = 15.00;
                              }
                              break;

                              case "Velas Avulso": {
                                valorProduto = 2.40;
                              }
                              break;

                              case "Sabonetes Artesanais Grande": {
                                valorProduto = 8.00;
                              }
                              break;

                              case "Sabonetes Artesanais Médio": {
                                valorProduto = 6.50;
                              }
                              break;

                              case "Sabonetes Artesanais Pequeno": {
                                valorProduto = 3.50;
                              }
                              break;

                              case "Mini sabonetes com 10 unid.": {
                                valorProduto = 6.50;
                              }
                              break;

                              case "Sabonetes Hidratante Aveia": {
                                valorProduto = 8.50;
                              }
                              break;

                              case "Sabonete anti cravo e espinhas": {
                                valorProduto = 8.50;
                              }
                              break;

                              case "Sabonetes Linha Fruit": {
                                valorProduto = 8.50;
                              }
                              break;

                              default: {
                                //statements;
                              }
                              break;
                            }
                            valorTotal = valorProduto * double.parse(quantidade);
                            valoresPedido.add(valorTotal);
                            _pedido.add(
                                "$quantidade un. ${_itemSelecionadoTipoProduto}: ${_itemSelecionadoEssencias} \n valor = R\$ ${valorTotal.toStringAsPrecision(4)} ");
                            valorPedido = 0;
                            valoresPedido.forEach((element) {
                              valorPedido += element;

                              //_controllerNome.clear();
                              _itemSelecionadoTipoProduto = " ";
                              _itemSelecionadoEssencias = " ";
                              _controllerQuantidade.clear();

                            } );
                          });
                        }),
                  ),
                ],
              ),
        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.4,
            child: Card(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pedido",style: TextStyle(fontSize: 30,color: Colors.white,backgroundColor: Colors.purple[400]),),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: SingleChildScrollView(
                        child: Center(
                          child: Text("Valor Pedido: R\$ ${valorPedido.toString()}",style: TextStyle(fontSize: 15,color: Colors.blue,),),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.red[100],
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                      children: [
                        Expanded(
                          child:ListView.builder(
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: _pedido.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                  key: UniqueKey() ,
                                  onDismissed: (direction){
                                    setState(() {
                                      _pedido.removeAt(index);
                                      valoresPedido.removeAt(index);
                                      valorPedido = 0;
                                      valoresPedido.forEach((element) {
                                        valorPedido += element;
                                      });

                                    });
                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width * 0.8,
                                    height:
                                    MediaQuery.of(context).size.height * 0.08,
                                    color: Colors.purple[100],
                                    child: Center(
                                        child: Text('${_pedido[index]}')),
                                  ),
                                );
                              }),
                        ),
                      ]
                  ),
                ),

                    ],
            ),
              ),

            ),
          ),
        ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          showAlertDialogSalvar(BuildContext context) {
            Widget cancelaButton = FlatButton(
              child: Text("Cancelar"),
              onPressed:  () {
                Navigator.pop(context);

              },
            );
            Widget continuaButton = FlatButton(
              child: Text("Salvar"),
              onPressed:  () {
                valorPedido = 0;
                valoresPedido.forEach((element) {
                  valorPedido += element;
                } );
                print(valorPedido);
                String produtos = " ";
                var buffer = StringBuffer();
                _pedido.forEach((valor) {
                  buffer.writeln(" | ${valor} |");
                });
                produtos = buffer.toString();
                print("#${produtos}");

                adicionarPedido(produtos);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
            //configura o AlertDialog
            AlertDialog alert = AlertDialog(
              title: Text("Pedido"),
              content: Text("Deseja Salvar esse Pedido ?"),
              actions: [
                cancelaButton,
                continuaButton,
              ],
            );
            //exibe o diálogo
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              },
            );
          }

          showAlertDialogSalvar(context);


        },
        label: Text('Salvar Pedido'),
        icon: Icon(Icons.save,color: Colors.white,),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
