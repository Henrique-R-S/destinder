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
                    //
                    // TABBAR LAYOUT
                    //

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
                  //
                  // TELA DE PERFIL
                  //

                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage("images/foto_perfil.jpg"),
                          radius: 60.0,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(child: Container()),
                              Text(
                                dados.nome + ", ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                dados.dtNascimento,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.edit),
                              Expanded(child: Container())
                            ]),
                        SizedBox(
                          height: 20.0,
                        ),
                        Divider(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Icon(Icons.settings,
                                      size: 20.0, color: Colors.grey),
                                  Text(
                                    "Configurações".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(Icons.add_a_photo,
                                      size: 50.0, color: Colors.lightBlue[700]),
                                  Text(
                                    "Adicionar Mídia".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: <Widget>[
                                  Icon(Icons.edit,
                                      size: 20.0, color: Colors.grey),
                                  Text(
                                    "Editar\nInformações".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ]),
                        Expanded(child: Container()),
                        RaisedButton(
                          textColor: Colors.lightBlue[700],
                          color: Colors.white,
                          child: Text(
                            "Voltar".toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: BorderSide(color: Colors.transparent),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                      ],
                    ),
                  ),

                  //
                  // TELA DE MATCHES
                  //

                  Center(
                    child: Card(
                      child: Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage('images/garota.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            ListTile(
                              
                              title: Text(
                                "Fulana Da Silva",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              subtitle: Text(
                                "Informações da pessoa",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            ButtonBar(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                RaisedButton(
                                  color: Colors.red,
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.arrow_left,
                                    color: Colors.white,
                                  ),
                                ),
                                RaisedButton(
                                  color: Colors.blue,
                                  onPressed: () {},
                                  child: Icon(Icons.arrow_drop_up,
                                      color: Colors.white),
                                ),
                                RaisedButton(
                                  color: Colors.green,
                                  onPressed: () {},
                                  child: Icon(Icons.arrow_right,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //
                  // TELA DE MENSAGENS
                  //

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
