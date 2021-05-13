import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/view/components/AppComponent.dart';
import 'package:ludo_academy/view/blocs/AuthenticationBloc.dart';

import 'controller/config/Application.dart';
import 'model/login/AuthenticationEvent.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {


    runApp(
      BlocProvider<AuthenticationBloc>(
        builder: (context) {
          return AuthenticationBloc(userRepository: Application.oRepositoryAcesso)
            ..dispatch(AppStarted());
        },
        child: AppComponent(userRepository: Application.oRepositoryAcesso),
      ),
    );
  });
}
