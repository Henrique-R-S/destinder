import 'package:flutter/material.dart';
import 'package:projeto/dadosUsuario.dart';

//
// Perfil
//

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  // Lista dinâmica com os itens do ListView
  List<Usuario> lista = [];

  //Controles para o Título e Subtítulo
  TextEditingController txtTitulo = new TextEditingController();
  TextEditingController txtSubTitulo = new TextEditingController();

  //Especificação da aparência do Item da List
  Widget _itemLista(context, index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: ListTile(
          leading: Icon(lista[index].icone),
          title: Text(
            lista[index].titulo,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          subtitle: Text(
            lista[index].subtitulo,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Atributo que receberá dados
    final Mensagem obj = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: Colors.black,
                child: TabBar(
                  indicatorColor: Colors.red,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.whatshot,
                        color: Colors.red,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.chat,
                        color: Colors.white,
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
                        Text(
                          "Email: " + obj.email,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Senha: " + obj.senha,
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Icon(Icons.account_circle, size: 64.0),
                        SizedBox(height: 20),
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
                    child: Icon(Icons.whatshot, size: 64.0),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: txtTitulo,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Titulo",
                                ),
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Subtitulo",
                                ),
                              ),
                            ),
                            Expanded(
                              child: RaisedButton(
                                onPressed: () {
                                  lista.add(
                                    Usuario(Icons.fiber_new, txtTitulo.text,
                                        txtSubTitulo.text),
                                  );
                                },
                                child: Text("+"),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: lista.length,
                            itemBuilder: _itemLista,
                          ),
                        ),
                      ],
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