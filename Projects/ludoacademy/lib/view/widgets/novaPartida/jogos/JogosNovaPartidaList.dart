import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/database/Jogo.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';


class JogosNovaPartidaList extends StatelessWidget {

  final List<Jogo> items;

  JogosNovaPartidaList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    NovaPartidaBloc oBlocNovaPartida = BlocProvider.of<NovaPartidaBloc>(context);

    return Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: <Widget>[
            Divider(
              color: new Color(0xFFBBBBBB),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Text("SELECIONE O JOGO"),
            Padding(padding: EdgeInsets.all(10)),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(items.length, (index) {
                return InkWell(
                  onTap: () {
                    oBlocNovaPartida.oNovaPartida.setJogo(items[index]);

                    Application.kTab.currentState.oTabController.animateTo(1);


                    //oBlocNovaPartida.dispatch(NovaPartidaTurmaLoad());
                  },
                  child: Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: new Color(int.parse("0xFF" + items[index].cor)),
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 3,
                      child: /*Text(
                    items[index].nome.toUpperCase(),
                    style: Theme.of(context).textTheme.headline,
                  ),*/

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/spinningwheel.gif',
                          image: Application.sUrlApi + "/img/jogos/" +
                              items[index].logo,
                          alignment: Alignment.center,
                        ),
                      )

                  ),
                );
              }),
            ),
          ],
        )

    );
  }
}