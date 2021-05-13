import 'package:flutter/material.dart';

class Screen_Home extends StatefulWidget {
  @override
  _Screen_HomeState createState() => _Screen_HomeState();
}

class _Screen_HomeState extends State<Screen_Home> {

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            backgroundColor:Color(0xFF001e64),
          content: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF001e64),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  )),

              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                    child: Image.asset("images/logoBranco.png"),
                  ),
                  Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                      child: Text(
                        "Inovamos sempre para atender necessidades em tudo o que se refere à Beleza, Estética Avançada, Bem Estar e Saúde.\n\n Qual o seu Objetivo",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )
                  ),
                ],
              ),
            ),
          )
        ));
  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      drawer: Drawer(
        elevation : 60,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple[800], Color(0xFF001e64)])
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Image.asset("images/logoBranco.png"),
                decoration: BoxDecoration(
                  color: Color(0xFF001e64),
                ),
              ),
              ListTile(
                title: Text(
                  "Olenka Estética Avançada",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  print("oi");
                },
              ),
              ListTile(
                title: Text(
                  "Rua Três Mosqueteiros, 279 Santana São Paulo",
                  style: TextStyle(color: Colors.white,fontSize: 15),
                  textAlign: TextAlign.left,
                ),
                onTap: () {
                  print("oi");
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.email),
                    Text(
                      "atendimento@olenkaclinica.com.br",
                      style: TextStyle(color: Colors.white,fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                onTap: () {
                  print("oi");
                },
              ),
              ListTile(
                title: Text(
                  "Olenka Saúde",
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  print("oi");
                },
              ),
            ],
          ),
        ),// Populate the Drawer in the next step.
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFF001e64),
        title: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
          child: Image.asset("images/logoBranco.png"),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              child: InkWell(
                onTap: (){
                  print("whattsapp");
                },
                child: Image.asset("images/whattsapp.png"),
              )
          ),

        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.45,
                child: InkWell(
                  onTap: (){
                    print("xxx");
                  },
                  child: Stack(
                    children: [

                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Image.asset("images/estetica_home.png",
                            fit: BoxFit.fitHeight),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height * 0.03,
                            0,
                            MediaQuery.of(context).size.height * 0.03,
                            MediaQuery.of(context).size.height * 0.03),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff511196).withOpacity(0.9),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              )),
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.45,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height * 0.1,
                            MediaQuery.of(context).size.height * 0.15,
                            MediaQuery.of(context).size.height * 0.05,
                            MediaQuery.of(context).size.height * 0.05),
                        child: Image.asset("images/logo_olenka_estetica.png",
                        ),
                      ),
                      ClipPath(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: Colors.pinkAccent,
                        ),
                        clipper: CustomClipPath(),
                      ),
                      ClipPath(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.08,
                          color: Colors.pink[800],
                        ),
                        clipper: CustomClipPath(),
                      ),
                    ],
                  ),
                ),),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.45,
                child: InkWell(
                  onTap: (){
                    print("saude");
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Image.asset("images/clinica_home.png",
                            fit: BoxFit.fitHeight),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height * 0.03,
                            0,
                            MediaQuery.of(context).size.height * 0.03,
                            MediaQuery.of(context).size.height * 0.03),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff172396).withOpacity(0.9),
                              borderRadius: BorderRadius.all(
                                Radius.circular(40.0),
                              )),
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.45,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.height * 0.1,
                            MediaQuery.of(context).size.height * 0.15,
                            MediaQuery.of(context).size.height * 0.05,
                            MediaQuery.of(context).size.height * 0.05),
                        child: Image.asset("images/logo_olenka_saude.png",
                        ),
                      ),
                      ClipPath(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.1,
                          color: Colors.blue,
                        ),
                        clipper: CustomClipPath(),
                      ),
                      ClipPath(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: MediaQuery.of(context).size.height * 0.08,
                          color: Colors.blue[800],
                        ),
                        clipper: CustomClipPath(),
                      ),
                    ],
                  ),
                ),),




            ],
          ),
        ),
      ),
    );
  }
}
class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
    Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
