import 'package:flutter/material.dart';
import 'package:projeto/dadosUsuario.dart';

//
// Principal
//

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  //Controles para o Título e Subtítulo
  TextEditingController txtTitulo = new TextEditingController();
  TextEditingController txtSubTitulo = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DadosUsuario dados = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  indicatorColor: Colors.lightBlue[300],
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.ac_unit,
                        color: Colors.lightBlue[300],
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.chat,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.account_circle, size: 64.0),
                        Row(children: <Widget>[
                          Text(
                            "Nome: " + dados.nome,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Data Nascimento: " + dados.dtNascimento,
                            style: TextStyle(fontSize: 16),
                          ),
                        ]),
                        Expanded(
                          child: Container(
                            height: 2.0,
                            decoration: BoxDecoration(color: Colors.grey),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          Icon(Icons.settings, size: 32.0),
                          Icon(Icons.add_a_photo, size: 40.0, color: Colors.lightBlue[700]),
                          Icon(Icons.edit, size: 32.0)
                        ]),
                        SizedBox(height: 60),
                        RaisedButton(
                          child: Text("Voltar"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.ac_unit,
                      size: 64.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.message,
                      size: 64.0,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
