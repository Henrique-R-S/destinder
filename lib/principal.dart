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
                                dados.nome + ", " + dados.dtNascimento,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
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
                                children: [
                                  RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: Colors.white,
                                    shape: CircleBorder(),
                                    child: Icon(Icons.settings,
                                        size: 20.0, color: Colors.grey),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed("/configuracoes");
                                    },
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    "Configurações".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: <Color>[
                                          Colors.indigo[400],
                                          Colors.cyan,
                                          Colors.lightBlue[300],
                                        ],
                                      ),
                                    ),
                                    child: RawMaterialButton(
                                      child: Icon(Icons.add_a_photo,
                                          size: 30.0, color: Colors.white),
                                      shape: CircleBorder(),
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    "Mídia".toUpperCase(),
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
                                  RawMaterialButton(
                                    elevation: 2.0,
                                    fillColor: Colors.white,
                                    shape: CircleBorder(),
                                    child: Icon(Icons.edit,
                                        size: 20.0, color: Colors.grey),
                                    onPressed: () {},
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    "Informações".toUpperCase(),
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
                        Container(
                          width:  MediaQuery.of(context).size.width * 0.4,
                          child: RaisedButton(
                            textColor: Colors.lightBlue[700],
                            color: Colors.white,
                            child: Text(
                              "Sair".toUpperCase(),
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
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
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.white,
                                      ),
                                    ),
                                    RaisedButton(
                                      color: Colors.green,
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.arrow_right,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //
                  // TELA DE MENSAGENS
                  //

                  ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      for(int i = 0; i < 10; i++)
                        Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("images/garota.jpg"),
                          ),
                          title: Text('Conversa ${i+1}'),
                          subtitle: Text('Última mensagem da conversa'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
