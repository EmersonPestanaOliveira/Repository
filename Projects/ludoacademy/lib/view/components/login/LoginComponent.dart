import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/login/AuthenticationEvent.dart';
import 'package:ludo_academy/model/login/AuthenticationState.dart';
import 'package:ludo_academy/view/components/home/HomeComponent.dart';
import 'package:ludo_academy/view/widgets/login/LoginLoading.dart';
import 'package:ludo_academy/view/widgets/login/LoginPage.dart';
import 'package:ludo_academy/view/widgets/login/LoginSplash.dart';

import 'package:ludo_academy/view/blocs/AuthenticationBloc.dart';

class LoginComponent extends StatefulWidget {
  @override
  State createState() => new LoginComponentState();
}

class LoginComponentState extends State<LoginComponent> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold (
        resizeToAvoidBottomPadding: false,
        body: LayoutBuilder(
          builder: (context, constraints) => SafeArea(
            top: false,
            bottom: false,
            child: Container(
              color: new Color(0xFF00b4ff),
              child: BlocBuilder<AuthenticationEvent, AuthenticationState>(
                bloc: BlocProvider.of<AuthenticationBloc>(context),
              builder: (BuildContext context, AuthenticationState state) {
                if (state is AuthenticationUninitialized) {
                  return LoginSplash();
                }
                if (state is AuthenticationAuthenticated) {
                  return HomeComponent(key: Application.kHome);
                }
                if (state is AuthenticationUnauthenticated) {
                  return LoginPage(userRepository: Application.oRepositoryAcesso);
                }
                if (state is AuthenticationLoading) {
                  return LoginLoading();
                }
              },
          ),
            ),
          )
        ));
  }

}
