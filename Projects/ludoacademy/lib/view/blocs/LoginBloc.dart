import 'dart:async';

import 'package:ludo_academy/controller/repository/acesso/AcessoRepository.dart';
import 'package:ludo_academy/model/login/AuthenticationEvent.dart';
import 'package:ludo_academy/model/login/LoginEvent.dart';
import 'package:ludo_academy/model/login/LoginState.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:ludo_academy/view/blocs/AuthenticationBloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AcessoRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        if (token == "1") {
          authenticationBloc.dispatch(LoggedIn(token: token));
          yield LoginInitial();
        }
        else {
          yield LoginFailure(error: "Erro na autenticação");
        }



      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}