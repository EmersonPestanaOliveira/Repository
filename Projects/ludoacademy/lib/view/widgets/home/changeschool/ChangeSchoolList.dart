import 'package:flutter/material.dart';
import 'package:ludo_academy/controller/config/AppTheme.dart';
import 'package:ludo_academy/controller/config/Application.dart';
import 'package:ludo_academy/model/database/Escola.dart';

class ChangeSchoolList extends StatefulWidget {
  final List<Escola> items;

  ChangeSchoolList({Key key, @required this.items}) : super(key: key);

  @override
  State createState() => new ChangeSchoolListStateComponent();
}

class ChangeSchoolListStateComponent extends State<ChangeSchoolList> {

  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: ListView.builder(

          physics: BouncingScrollPhysics(),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            //return Text(items[index].nome.toUpperCase());

            Color cBorda;

            if (Application.oProfile.escolaId == widget.items[index].id) {
              cBorda = AppTheme.cDefaultTextColor2;
            }
            else {
              cBorda = Colors.black;
            }

            return InkWell(
              onTap: () {

                setState(() {
                  Application.oProfile.escolaId = widget.items[index].id;
                  Application.oProfile.escolaNome = widget.items[index].nome;

                  Application.kHome.currentState.forceUpdate();
                  Application.oRouter.pop(context);
                });

              },
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: cBorda
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white
                      //gradient: AppTheme.partidaDefault
                    ),
                    child: ListTile(
                      title: Text(widget.items[index].nome.toUpperCase(), style: TextStyle(
                          color: cBorda,
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                      )),
                      subtitle: Text(widget.items[index].endereco.toUpperCase() + ", " + widget.items[index].complemento.toUpperCase()
                                + " - " + widget.items[index].bairro.toUpperCase() + " - " + widget.items[index].cidade.toUpperCase(), style: TextStyle(
                          color: cBorda,
                          fontFamily: AppTheme.fDefaultTextFont,
                          fontSize: 12
                      )),
                      trailing: Icon(Icons.keyboard_arrow_right, color: AppTheme.cDefaultTextColor2),
                    ),
                  )
              ),
            );
          })
  );
}