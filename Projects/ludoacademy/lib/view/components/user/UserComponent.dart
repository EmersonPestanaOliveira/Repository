import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/user/UsuarioEvent.dart';
import 'package:ludo_academy/view/blocs/inteligencia/InteligenciaBloc.dart';
import 'package:ludo_academy/view/blocs/user/DetalhesBloc.dart';
import 'package:ludo_academy/view/blocs/user/UserBloc.dart';
import 'package:ludo_academy/view/widgets/user/User.dart';

class UserComponent extends StatefulWidget {

  final String id;

  const UserComponent({Key key, this.id}) : super(key: key);

  @override
  State createState() => new UserComponentState();
}

class UserComponentState extends State<UserComponent>
{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DetalhesBloc oBlocDetalhes = new DetalhesBloc(oDetalhesRepository: Application.oRepositoryDetalhes);
    InteligenciaBloc oBlocInteligencia = new InteligenciaBloc(oInteligenciaRepository: Application.oRepositoryInteligencia, nUserId: int.parse(widget.id));

    return Scaffold (
        appBar: AppBar(
          leading: InkWell(
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
              onTap: () {
                Application.oRouter.pop(context);
              },
          ),
          backgroundColor: new Color(0xFF00b4ff),
          elevation: 0,
          title: Text("DESEMPENHO ALUNO",
                      style: TextStyle(
                        fontSize: 16
                      )),
          centerTitle: true,
        ),
        resizeToAvoidBottomPadding: false,
        body: BlocProvider<UserBloc>(
            builder: (context) {
              return UserBloc(oUsuarioRepository: Application.oRepositoryUsuario, oBlocDetalhes: oBlocDetalhes, oBlocInteligencia: oBlocInteligencia)..dispatch(UsuarioLoad(widget.id));
            },
            child: User()
        ));
  }
}