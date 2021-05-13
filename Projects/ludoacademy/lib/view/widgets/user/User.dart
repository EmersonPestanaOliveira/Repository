import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/model/user/UsuarioEvent.dart';
import 'package:ludo_academy/model/user/UsuarioState.dart';
import 'package:ludo_academy/view/blocs/user/UserBloc.dart';

import '../DefaultError.dart';
import '../DefaultLoading.dart';
import 'UserDetails.dart';
import 'UserEmpty.dart';

class User extends StatefulWidget {

  @override
  State createState() {
    return new UserWidgetState();
  }
}

class UserWidgetState extends State<User> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => SafeArea(
            top: false,
            bottom: false,
            child: Container (
              color: new Color(0xFF00b4ff),
              child: BlocBuilder<UsuarioEvent, UsuarioState>(
                bloc: BlocProvider.of<UserBloc>(context),
                builder: (BuildContext context, UsuarioState state) {
                  if (state is UsuarioUninitialized) {
                    return DefaultLoading();
                  }
                  if (state is UsuarioLoading) {
                    return DefaultLoading();
                  }
                  if (state is UsuarioEmpty) {
                    return UserEmpty();
                  }
                  if (state is UsuarioInitialized) {
                    return DefaultLoading();
                  }
                  if (state is UsuarioInitializedFinal) {
                    return UserDetails(oDetalhes: state.oDetalhes, oInteligencias: state.oInteligencias, oUsuario: state.oUsuario);
                  }
                  if (state is UsuarioError) {
                    return DefaultError(sError: state.sError);
                  }
                },
              ),
            )
        )
    );
  }
}

