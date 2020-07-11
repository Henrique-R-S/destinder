import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'caixaDeTexto.dart';

class DadosUsuario {
  //Atributos

  String _nome;
  String _email;
  String _dtNascimento;
  String _senha;

  //Construtor
  DadosUsuario(this._nome, this._email, this._dtNascimento, this._senha);

  //Getters

  String get nome => _nome;
  String get email => _email;
  String get dtNascimento => _dtNascimento;
  String get senha => _senha;

  DadosUsuario.map(dynamic obj) {
    this._nome = obj['nome'];
    this._email = obj['email'];
    this._dtNascimento = obj['dtNascimento'];
    this._senha = obj['senha'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map["nome"] = _nome;
    map["email"] = _email;
    map["dtNascimento"] = _dtNascimento;
    map["senha"] = _senha;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  DadosUsuario.fromMap(Map<String, dynamic> map) {
    this._nome = map["nome"];
    this._email = map["email"];
    this._dtNascimento = map["dtNascimento"];
    this._senha = map["senha"];
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
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nome = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();
  TextEditingController _dtNascimento = TextEditingController();

  final db = Firestore.instance;
  final String colecao = "Usuarios";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Colors.indigo[400],
      ),
      body: StreamBuilder<Object>(
          stream: null,
          builder: (context, snapshot) {
            return Container(
              height: MediaQuery.of(context).size.height * 100,
              width: MediaQuery.of(context).size.width * 100,
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    caixaDeTexto(
                        "Nome", _nome, TextInputType.text, Icons.person, false),
                    SizedBox(height: 10),
                    caixaDeTexto("Data Nascimento", _dtNascimento,
                        TextInputType.datetime, Icons.date_range, false),
                    SizedBox(height: 10),
                    caixaDeTexto("Email", _email, TextInputType.emailAddress,
                        Icons.email, false),
                    SizedBox(height: 10),
                    caixaDeTexto(
                        "Senha", _senha, TextInputType.text, Icons.lock, true),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 100,
                      child: RaisedButton(
                        textColor: Colors.lightBlue[700],
                        color: Colors.white,
                        child: Text(
                          "Cadastrar".toUpperCase(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          side: BorderSide(color: Colors.transparent),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            inserir(
                                context,
                                DadosUsuario(
                                    _nome.text,
                                    _email.text,
                                    _dtNascimento.text,
                                    textToMd5(_senha.text)));
                          } else {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Falha ao criar o cadstro!"),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          }
                        },
                        padding: EdgeInsets.all(0.0),
                      ),
                    ),
                    SizedBox(width: 10),
                    Center(
                      child: Text(
                        "*Ao clicar em Cadastrar, você concorda com os nossos ",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      child: Center(
                        child: Text(
                          "Termos e Política de Privacidade.",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  void inserir(BuildContext context, DadosUsuario dadosUsuario) async {
    await db.collection("Usuarios").document(dadosUsuario.email).setData({
      "nome": dadosUsuario.nome,
      "dtNascimento": dadosUsuario.dtNascimento,
      "senha": dadosUsuario.senha,
    });
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Cadastro realizado com sucesso!"),
        backgroundColor: Colors.redAccent,
      ),
    );
    Navigator.pushReplacementNamed(context, "/login");
  }

  // Realiza criptografia da senha
  String textToMd5(String text) {
    return md5.convert(utf8.encode(text)).toString();
  }
}
