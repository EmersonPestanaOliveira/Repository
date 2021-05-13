import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/database/Jogo.dart';


class JogosList extends StatelessWidget {

  final List<Jogo> items;

  JogosList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(items.length, (index) {
          return InkWell(
            onTap: () {
              Application.oRouter.navigateTo(
                  context,
                  '/game/' + items[index].id.toString(),
                  //'/soon',
                  transition:
                  TransitionType
                      .inFromRight)
                  .then((result) {

              });
            },
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: new Color(int.parse("0xFF" + items[index].cor)),
              ),
              width: MediaQuery.of(context).size.width / 3,
              child: /*Text(
                items[index].nome.toUpperCase(),
                style: Theme.of(context).textTheme.headline,
              ),*/

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/spinningwheel.gif',
                  image: Application.sUrlApi + "/img/jogos/" + items[index].logo,
                  alignment: Alignment.center,
                ),
              )

            ),
          );
        }),
      )

  );
}