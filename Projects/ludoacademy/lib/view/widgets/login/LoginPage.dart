import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/repository/acesso/AcessoRepository.dart';
import 'package:ludo_academy/view/blocs/AuthenticationBloc.dart';
import 'package:ludo_academy/view/blocs/LoginBloc.dart';

import 'LoginForm.dart';

class LoginPage extends StatelessWidget {
  final AcessoRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
            padding: new EdgeInsets.fromLTRB(20, 0, 40, 20),
            child: new ConstrainedBox(
                constraints: new BoxConstraints(minHeight: 100.0),
                child: new DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/root/LOGO.png"),
                      )),
                )
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: BlocProvider(
            builder: (context) {
              return LoginBloc(
                authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
                userRepository: userRepository,
              );
            },
            child: LoginForm(),
          ),
        ),
      ],
    );
  }
}