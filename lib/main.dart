import 'package:flutter/material.dart';

//
// CÓDIGO INICIAL
//
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App Brabo",
      initialRoute: "/login",
      routes: {
        "/login": (context) => Login(),
        "/perfil": (context) => Perfil(),
        "/cadastro": (context) => Cadastro(),
        "/recuperacao": (context) => Recuperacao(),
      },
    );
  }
}

//
// Login
//

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //atributos para receber dados informados
  String _email;
  String _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
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
          padding: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image(
                  image: AssetImage("images/destinder.png"),
                ),
                SizedBox(height: 20),
                TextField(
                  // Pega os valores digitados
                  onChanged: (text) {
                    _email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextField(
                  // Pega os valores digitados
                  onChanged: (text) {
                    _senha = text;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "Senha",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "*Ao clicar em Entrar, você concorda com os nossos Termos, Política de Privacidade e Política de Cookies.",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        textColor: Colors.lightBlue[700],
                        color: Colors.white,
                        child: Text(
                          "Entrar".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        onPressed: () {
                          //  Criar OBJ contendo dados pra outra tela
                          
                          if (_email.isEmpty || _senha.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Dados inválidos."),
                                  content: Text("Por favor, tente novamente."),
                                  actions: <Widget> [
                                    FlatButton(
                                      child: Text("OK"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          } else {
                            var obj = Mensagem(_email, _senha);
                            Navigator.pushNamed(context, "/perfil",
                                arguments: obj);
                          }
                        },
                        padding: EdgeInsets.all(0.0),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: RaisedButton(
                        textColor: Colors.lightBlue[700],
                        color: Colors.white,
                        child: Text(
                          "Cadastre-se".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        onPressed: () {
                          //  Criar OBJ contendo dados pra outra tela
                          Navigator.pushNamed(
                            context,
                            "/cadastro",
                          );
                        },
                        padding: EdgeInsets.all(0.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  child: Center(
                    child: Text(
                      "Esqueci minha senha.",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/recuperacao",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// Cadastro
//

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: null,
    );
  }
}

//
// Recuperação
//

class Recuperacao extends StatefulWidget {
  @override
  _RecuperacaoState createState() => _RecuperacaoState();
}

class _RecuperacaoState extends State<Recuperacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperação de senha"),
      ),
      body: null,
    );
  }
}

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

//
// CLASSES AVULSAS
//

class Mensagem {
  final String email;
  final String senha;

  Mensagem(this.email, this.senha);
}

class Usuario {
  var icone;
  final String titulo;
  final String subtitulo;

  Usuario(this.icone, this.titulo, this.subtitulo);
}
