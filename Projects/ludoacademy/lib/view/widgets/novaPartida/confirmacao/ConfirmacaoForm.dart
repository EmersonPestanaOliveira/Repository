import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/help/AlertHelper.dart';
import 'package:ludo_academy/view/blocs/novaPartida/NovaPartidaBloc.dart';
import 'package:ludo_academy/view/blocs/novaPartida/confirmacao/ConfirmacaoBloc.dart';
import 'package:ludo_academy/model/novaPartida/confirmacao/ConfirmacaoEvent.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ConfirmacaoForm extends StatefulWidget {

  final NovaPartidaBloc oNovaPartidaBloc;

  const ConfirmacaoForm({Key key, this.oNovaPartidaBloc}) : super(key: key);

  @override
  State createState() => new ConfirmacaoFormState();
}

class ConfirmacaoFormState extends State<ConfirmacaoForm> {
  @override
  void initState() {
    super.initState();
  }//

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container()
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column (
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("CONFIRMAR DADOS \nDA PARTIDA", style: TextStyle(
                      color: AppTheme.cDefaultTextColor2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ), textAlign: TextAlign.center),
                    Divider(),
                    Container (
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.lightBlue
                          ),
                          color: Colors.white
                      ),
                      child: ListTile(
                        onTap: () {

                        },
                        title: Text(widget.oNovaPartidaBloc.oNovaPartida.oJogo.nome.toUpperCase(), style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.fDefaultTextFont,
                            color: AppTheme.cDefaultTextColor2
                        )),
                        trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.cDefaultTextColor2),
                      ),
                    ),
                    Container (
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.lightBlue
                          ),
                          color: Colors.white
                      ),
                      child: ListTile(
                        onTap: () {

                        },
                        title: Text(widget.oNovaPartidaBloc.oNovaPartida.sNomeTurma.toUpperCase(), style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.fDefaultTextFont,
                            color: AppTheme.cDefaultTextColor2
                        )),
                        trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.cDefaultTextColor2),
                      ),
                    ),
                    Container (
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.lightBlue
                          ),
                          color: Colors.white
                      ),
                      child: ListTile(
                        onTap: () {

                        },
                        title: Text(widget.oNovaPartidaBloc.oNovaPartida.lAlunos.length.toString() + " ALUNOS", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.fDefaultTextFont,
                            color: AppTheme.cDefaultTextColor2
                        )),
                        trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.cDefaultTextColor2),
                      ),
                    ),
                    Container (
                      margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.lightBlue
                          ),
                          color: Colors.white
                      ),
                      child: ListTile(
                        onTap: () {

                        },
                        title: Text(widget.oNovaPartidaBloc.oNovaPartida.lMesas.length.toString() + " MESA(S)", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppTheme.fDefaultTextFont,
                            color: AppTheme.cDefaultTextColor2
                        )),
                        trailing: Icon(Icons.arrow_forward_ios, color: AppTheme.cDefaultTextColor2),
                      ),
                    ),
                    Divider(),
                    RaisedButton(
                      child: Text("CONFIRMAR", style: TextStyle(
                        fontFamily: AppTheme.fDefaultTextFont,
                        color: Colors.white,
                        fontSize: 12
                      )),
                      color: AppTheme.cDefaultTextColor2,
                      onPressed: () {
                        showConfirmAlert();
                      },
                    )
                  ],
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Container()
            )
          ],
        ),
      ),
    );
  }

  void showConfirmAlert() {
    List<DialogButton> _buttons = new List<DialogButton>();
    _buttons.addAll([
      DialogButton(
          radius: BorderRadius.all(Radius.circular(0)),
          child: Text(
            "SIM",
            style: AppTheme.botaoSim
          ),
          onPressed: () {
            Navigator.pop(context);
            ConfirmacaoBloc c = BlocProvider.of<ConfirmacaoBloc>(context);
            c.dispatch(AddPartida(oNovaPartida: widget.oNovaPartidaBloc, context: context));
          },
          color: AppTheme.cDefaultTextColor2
      ),
      DialogButton(
        radius: BorderRadius.all(Radius.circular(0)),
        child: Text(
          "NÃO",
          style: AppTheme.botaoNao
        ),
        onPressed: () => Navigator.pop(context),
        color: AppTheme.cDefaultTextColor2,
      ),
    ]);

    AlertStyle _style = AppTheme.alertaStyle;

    AlertHelper.showAlert(context, "NOVA PARTIDA", "Deseja criar a partida?",
        _buttons, _style, this);
  }
}