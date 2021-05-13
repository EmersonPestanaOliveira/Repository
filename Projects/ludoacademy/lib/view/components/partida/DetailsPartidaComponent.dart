import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/partida/DetailsPartidaEvent.dart';
import 'package:ludo_academy/view/blocs/partida/DetailsPartidaBloc.dart';
import 'package:ludo_academy/view/widgets/partida/DetailsPartidaWidget.dart';

class DetailsPartidaComponent extends StatefulWidget {

  final int id;

  const DetailsPartidaComponent({Key key, this.id}) : super(key: key);

  @override
  State createState() => new DetailsPartidaStateComponent();
}

class DetailsPartidaStateComponent extends State<DetailsPartidaComponent>  {

  DetailsPartidaBloc oBlocDetailsPartida;

  @override
  void initState() {
    super.initState();

    oBlocDetailsPartida = DetailsPartidaBloc(oDetailsPartidaRepository: Application.oRepositoryDetailsPartida);

    print ("init details partida");
  }

  void forceUpdate() {
    setState(() {
      oBlocDetailsPartida.dispatch(DetailsPartidaLoad(widget.id));
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: BlocProvider<DetailsPartidaBloc>(
          builder: (context) {
            return oBlocDetailsPartida..dispatch(DetailsPartidaLoad(widget.id));
          },
          child: DetailsPartidaWidget()
      ),
    );
  }

}