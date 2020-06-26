import 'package:flutter/material.dart';

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
        backgroundColor: Colors.indigo[400],
      ),
      body: Container(
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
        child: ListView(
          children: <Widget>[
            TextField(
              onChanged: null,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Nome",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: null,
              keyboardType: TextInputType.datetime,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Data de nascimento",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: null,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                icon: Icon(Icons.message),
                labelText: "E-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: null,
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
            SizedBox(height: 10),
            RaisedButton(
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
              onPressed: () {},
              padding: EdgeInsets.all(0.0),
            ),
            SizedBox(width: 10),
            Center(
              child: Text(
                "*Ao clicar em Cadastrar, você concorda com os nossos Termos e Política de Privacidade.",
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
