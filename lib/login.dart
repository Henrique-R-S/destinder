import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:projeto/alerta.dart';
import 'package:projeto/dadosUsuario.dart';

//
// Login
//

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //atributos para receber dados informados
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email = "";
  var _senha = "";

  FocusNode myFocusNode = new FocusNode();

  final db = Firestore.instance;
  final String colecao = "Usuarios";

  DadosUsuario obj;

  btnCadastrar(BuildContext context, rotulo) {
    return Expanded(
      child: RaisedButton(
        textColor: Colors.lightBlue[700],
        color: Colors.white,
        child: Text(
          rotulo.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: BorderSide(color: Colors.transparent),
        ),
        onPressed: () {
          // Abre outra tela
          Navigator.pushNamed(context, "/cadastro");
        },
        padding: EdgeInsets.all(0.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Image(
                      image: AssetImage("images/destinder.png"),
                      height: 50.0,
                      width: 60.0),
                  SizedBox(height: 20),
                  TextField(
                    // Valida a entrada
                    onChanged: (text) {
                      _email = text;
                    },

                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black45),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(100.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    // Valida a entrada
                    onChanged: (text) {
                      _senha = text;
                    },

                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.black45),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(100.0)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
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
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              var busca = db
                                  .collection("Usuarios")
                                  .document(_email);
                              busca.get().then((document) {
                                if (document.exists &&
                                    document.data["senha"] == textToMd5(_senha))
                                  Navigator.pushNamed(context, "/principal",
                                      arguments: DadosUsuario(
                                          _email,
                                          document.data["nome"],
                                          document.data["dtNascimento"]));
                                else if (document.exists &&
                                    document.data["senha"] !=
                                        textToMd5(_senha)) {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  alerta(context, "Senha Incorreta!",
                                      "Tente novamente...");
                                } else {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  alerta(context, "Email não encontrado!",
                                      "Tente novamente ou cadastre-se");
                                }
                              });
                            } else {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              alerta(context, "Dados inválidos!",
                                  "Por favor tente novamente.");
                            }
                          },
                          padding: EdgeInsets.all(0.0),
                        ),
                      ),
                      SizedBox(width: 10),
                      btnCadastrar(context, "Cadastre-se"),
                    ],
                  ),
                  SizedBox(height: 10),
                  btnGoogle(context, "Entrar com o Google"),
                  SizedBox(height: 10),
                  btnFacebook(context, "Entrar com o Facebook"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
// BOTÕES
//

btnGoogle(BuildContext context, rotulo) {
  return RaisedButton(
    textColor: Colors.grey[700],
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("images/google-icon.png"),
          height: 20.0,
          width: 20.0,
        ),
        SizedBox(width: 10),
        Text(
          rotulo.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
      side: BorderSide(color: Colors.transparent),
    ),
    onPressed: () {},
    padding: EdgeInsets.all(0.0),
  );
}

btnFacebook(BuildContext context, rotulo) {
  return RaisedButton(
    textColor: Colors.white,
    color: Colors.blue[900],
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("images/facebook-icon.png"),
          height: 20.0,
          width: 20.0,
        ),
        SizedBox(width: 10),
        Text(
          rotulo.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.0),
      side: BorderSide(color: Colors.transparent),
    ),
    onPressed: () {},
    padding: EdgeInsets.all(0.0),
  );
}

String textToMd5(String text) {
  return md5.convert(utf8.encode(text)).toString();
}
