import 'dart:async';

import 'package:ludo_academy/controller/repository/acesso/AcessoRepository.dart';
import 'package:ludo_academy/model/login/AuthenticationEvent.dart';
import 'package:ludo_academy/model/login/AuthenticationState.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AcessoRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {

    if (event is AppRefresh) {
      yield AuthenticationLoading();

      await new Future.delayed(const Duration(milliseconds: 100));

      yield AuthenticationAuthenticated();
    }

    if (event is AppStarted) {
      final bool hasToken = await userRepository.hasToken();

      yield AuthenticationLoading();

      await new Future.delayed(const Duration(milliseconds: 100));

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}