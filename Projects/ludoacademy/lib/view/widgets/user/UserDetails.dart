import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/model/database/Usuario.dart';
import 'package:ludo_academy/libraries/spider_chart.dart';
import 'package:ludo_academy/model/user/DadosCompetencia.dart';
import 'package:ludo_academy/model/user/DadosUsuario.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math' as math;

class UserDetails extends StatefulWidget {
  final List<DadosUsuario> oDetalhes;
  final Usuario oUsuario;
  final List<DadosCompetencia> oInteligencias;

  const UserDetails({Key key, this.oDetalhes, this.oUsuario, this.oInteligencias}) : super(key: key);


  @override
  State createState() => new UserDetailsWidgetState();
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class UserDetailsWidgetState extends State<UserDetails> {

  List<String> _headers = new List<String>();
  List<DadosCompetencia> _dados = new List<DadosCompetencia>();

  @override
  Widget build(BuildContext context) {
    return makeSliver();
  }

  Widget makeSliver() {

    _headers.clear();
    _dados.clear();


    widget.oInteligencias.forEach((item) {

      if (!_headers.contains(item.inteligenciaNome)) {
        _headers.add(item.inteligenciaNome);
      }

      _dados.add(item);
    });

    print ("odetalhes: " + widget.oDetalhes.length.toString());

    widget.oDetalhes.forEach((item) {

      _dados.forEach((item2) {
        if (item.competencia == item2.competenciaId) {
          item2.valor = item.pontuacao;
        }

        //print ("item2: " + item2.valor.toString());
      });
    });

    List<Widget> h = List<Widget>();
    List<List<DadosCompetencia>> dadosCompetencias = new List<List<DadosCompetencia>>();

    List<double> dd = new List<double>();

    _headers.forEach((item) {
      h.add (makeHeader(context, item.toUpperCase()));
      h.add (SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ));

      List<DadosCompetencia> d = new List<DadosCompetencia>();
      List<int> d2 = new List<int>();



      _dados.forEach((item2) {
        if (item2.inteligenciaNome == item) {
          if (!d2.contains(item2.competenciaId)) {
            d2.add (item2.competenciaId);
            d.add(item2);
          }
        }
      });

      dadosCompetencias.add (d);

      h.add(_buildStatusSegment(d));

      h.add (SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      ));
    });

    // TODO build graphic properties
    dadosCompetencias.forEach((item) {
      int v = 2;
      item.forEach((item2) {
        if (item2.valor / 100 > 1) {
          v += 1;
        }

        //v = item2.valor;
      });
      dd.add (v.toDouble());
    });

    h.insert(0, SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(padding: EdgeInsets.all(30)),
          _buildChart(context, dd),
          Padding(padding: EdgeInsets.all(30)),
        ],
      ),
    ));


    h.insert(0, SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(widget.oUsuario.nome.toUpperCase() + " " + widget.oUsuario.sobrenome.toUpperCase(),
                style: AppTheme.tsDefaultBoldTextStyle18),
                Text(widget.oUsuario.turmaNome.toUpperCase(),
                style: AppTheme.tsDefaultTextStyle14),
              ],
            ),
          ),

          Divider(
            color: Colors.white,
          ),
        ],
      ),
    ));

    return CustomScrollView(
        slivers: h
    );
  }
}

SliverPersistentHeader makeHeader(BuildContext context, String headerText) {
  return SliverPersistentHeader(
    pinned: false,
    delegate: _SliverAppBarDelegate(
      minHeight: 50.0,
      maxHeight: 50.0,
      child: Container(
          padding: EdgeInsets.all(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1.1,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(headerText,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "MONTSERRAT",
                          fontWeight: FontWeight.bold,
                          fontSize: 20)))
            ],
          )),
    ),
  );
}

Widget _buildChart(BuildContext context, List<double> _data) {
  return SpiderChart(
    fallbackWidth: MediaQuery
        .of(context)
        .size
        .width / 2.7,
    fallbackHeight: MediaQuery
        .of(context)
        .size
        .height / 2.7,
    data: _data,
    maxValue: 10,
    // the maximum value that you want to represent (essentially sets the data scale of the chart)
    colors: <Color>[
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white
    ],
  );
}

Widget _buildStatusSegment(List<DadosCompetencia> list) {
  return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        if (index >= list.length) return null;
        return Container(
            height: 35,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2.5,
                    color: Colors.transparent,
                    child: Text(list[index].competenciaNome.toUpperCase(),
                        style: TextStyle(
                            fontFamily: "MONTSERRAT",
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))),
                Padding(padding: EdgeInsets.fromLTRB(25, 0, 5, 0)),
                Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2.3,
                    child: new LinearPercentIndicator(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2.3,
                      lineHeight: 16.0,
                      percent: list[index].valor / 1000,
                      progressColor: Colors.blue,
                    )),
              ],
            ));
      }));
}