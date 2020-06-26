import 'package:flutter/material.dart';
import 'package:projeto/caixaDeTexto.dart';
import 'package:projeto/botaoLogin.dart';
import 'package:projeto/botaoCadastrar.dart';
import 'package:projeto/botaoGoogle.dart';
import 'package:projeto/botaoFacebook.dart';

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
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();

  FocusNode myFocusNode = new FocusNode();

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
                  caixaDeTexto("Email", _email, TextInputType.emailAddress,
                      Icons.person, false),
                  SizedBox(height: 20),
                  caixaDeTexto(
                      "Senha", _senha, TextInputType.text, Icons.lock, true),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      botaoLogin(context, "Entrar", _email.text, _senha.text,
                          _formKey),
                      SizedBox(width: 10),
                      botaoCadastrar(context, "Cadastre-se"),
                    ],
                  ),
                  SizedBox(height: 10),
                  botaoGoogle(context, "Entrar com o Google"),
                  SizedBox(height: 10),
                  botaoFacebook(context, "Entrar com o Facebook"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
