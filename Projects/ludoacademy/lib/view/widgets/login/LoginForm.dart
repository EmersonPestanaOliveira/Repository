import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/model/login/LoginEvent.dart';
import 'package:ludo_academy/model/login/LoginState.dart';
import 'package:ludo_academy/view/blocs/LoginBloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {

      if (_usernameController.text == "") {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Preencha o campo "Usuário"'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_passwordController.text == "") {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Preencha o campo "Senha"'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }


      _loginBloc.dispatch(LoginButtonPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ));
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(60, 40, 60, 0),
      child: BlocListener(
        bloc: _loginBloc,
        listener: (context, state) {
          if (state is LoginFailure) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<LoginEvent, LoginState>(
          bloc: _loginBloc,
          builder: (
              BuildContext context,
              LoginState state,
              ) {
            return Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                      labelStyle: TextStyle(
                          color: Colors.white
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 0.0),
                      ),
                      //focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,

                    ),
                    controller: _usernameController,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  ),
                  Divider(),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 0.0),
                        ),
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                    ),
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  ),
                  Divider(),
                  RaisedButton(
                    color: AppTheme.cDefaultButtonBackground,
                    shape: Border.all(color: Colors.white),
                    elevation: 0,
                    onPressed:
                    state is! LoginLoading ? _onLoginButtonPressed : null,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text("ENTRAR",
                        style: TextStyle(
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontSize: 12
                        ),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent
                      ),
                    ),
                    textColor: Colors.white,

                  ),
                  Container(
                    child: state is LoginLoading
                        ? CircularProgressIndicator()
                        : null,
                  ),
                  RaisedButton(
                    elevation: 0,
                    highlightElevation: 0,
                    color: AppTheme.cDefaultButtonBackground,
                    onPressed: () {},
                    child: Text("Esqueceu sua senha?",
                        style: TextStyle(
                          fontSize: 12,
                        )),
                    textColor: Colors.white,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}