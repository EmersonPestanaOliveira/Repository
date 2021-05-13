import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/partida/DetailsMesaEvent.dart';
import 'package:ludo_academy/view/blocs/partida/DetailsMesaBloc.dart';
import 'package:ludo_academy/view/widgets/mesa/DetailsMesaWidget.dart';

class DetailsMesaComponent extends StatefulWidget {

  final int id;
  final int partida;

  const DetailsMesaComponent({Key key, this.id, this.partida}) : super(key: key);

  @override
  State createState() => new DetailsMesaStateComponent();
}

class DetailsMesaStateComponent extends State<DetailsMesaComponent>  {

  @override
  void initState() {
    print ("id da partida: " + widget.partida.toString());
    super.initState();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: BlocProvider<DetailsMesaBloc>(
          builder: (context) {
            return DetailsMesaBloc(oDetailsMesaRepository: Application.oRepositoryDetailsMesa)..dispatch(DetailsMesaLoad(widget.id, widget.partida));
          },
          child: DetailsMesaWidget()
      ),
    );
  }

}