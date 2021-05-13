import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/model/database/Turma.dart';
import 'package:ludo_academy/model/home/alunos/TurmaEvent.dart';
import 'package:ludo_academy/view/blocs/home/TurmaBloc.dart';

class AlunosTurmaSelect extends StatefulWidget {

  final List<Turma> oTurmas;
  final String sDefaultValue;

  const AlunosTurmaSelect({Key key, this.oTurmas, this.sDefaultValue}) : super(key: key);

  @override
  State createState() => new AlunosTurmaSelectState();
}

class AlunosTurmaSelectState extends State<AlunosTurmaSelect>
{
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentTurma;
  String _currentName;

  @override
  void initState() {

    _dropDownMenuItems = getDropDownMenuItems();
    _currentTurma = _dropDownMenuItems[0].value;

    print ("defaultValue: " + widget.sDefaultValue);


    if (widget.sDefaultValue == '-1') {
      _currentTurma = _dropDownMenuItems[0].value;
    }
    else {
      _currentTurma = widget.sDefaultValue;
    }


    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (Turma turma in widget.oTurmas) {
      items.add(new DropdownMenuItem(
          value: turma.id.toString(),
          child: new Text(turma.nome.toUpperCase())
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      width: MediaQuery.of(context).size.width,

      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: new DropdownButton(

              hint: Text("Selecione a turma".toUpperCase(), style: TextStyle(color: AppTheme.cDefaultLabelColorSelected)),
              value: _currentTurma,
              items: _dropDownMenuItems,
              onChanged: changedDropDownItem,
              style: AppTheme.tsDropDownAlunos,
              elevation: 0,
              isExpanded: true,
              underline: Container(),

            ),
          )
        ],
      ),
    );
  }

  void changedDropDownItem(String selectedTurma) {
    setState(() {

      TurmaBloc t = BlocProvider.of<TurmaBloc>(context);
      _currentTurma = selectedTurma;

      widget.oTurmas.forEach((turma) {
        if (_currentTurma == turma.id.toString()) {
          _currentName = turma.nome.toUpperCase();
        }
      });

      t.dispatch(TurmaSelect(_currentTurma, _currentName));
    });
  }


}

