import 'package:crudapp/bloc/screen_Register_Bloc.dart';
import 'package:flutter/material.dart';

class ScreenRegister extends StatefulWidget {
  @override
  _ScreenRegisterState createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister> {

  ScreenRegisterBloc bloc = ScreenRegisterBloc();

  TextEditingController _textEditingNameController = TextEditingController();
  TextEditingController _textEditingAgeController = TextEditingController();

  String _name = " ";
  String _age = " ";

  @override
  void initState(){
    bloc.input.add(bloc.name =  _name);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF3862F5),
          automaticallyImplyLeading: true,
          title: Center(
            child: Text(
              "Adicionar Usuário",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.04,
              ),
            ),
          )),
      body: Container(
        color: Color(0xFFCDCEF2),
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  Icons.person,
                  size: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                      ),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        hintText: "Nome:",
                        hintStyle: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                      controller: _textEditingNameController,
                      onChanged: (String name){
                        _name = name;
                        bloc.input.add(bloc.name = _name);
                        print(bloc.name);
                        //bloc.ReceiveName();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                      ),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        hintText: "Idade:",
                        hintStyle: TextStyle(fontSize: 30.0, color: Colors.black),
                      ),
                      controller: _textEditingAgeController,
                      onChanged: (String age){
                        _age = age;
                        bloc.input.add(bloc.age = _age);
                        print(bloc.age);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 1.3,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
                    child: FlatButton(
                      color: Color(0xFF3862F5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Salvar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.08),
                      ),
                      onPressed: () {
                        bloc.SendDatabaseRegister();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






