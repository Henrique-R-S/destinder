import 'package:flutter/material.dart';
import 'package:projeto/login.dart';
import 'package:projeto/recuperacao.dart';
import 'package:projeto/cadastro.dart';
import 'package:projeto/principal.dart';

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
      title: "Destinder",
      initialRoute: "/login",
      routes: {
        "/login": (context) => Login(),
        "/principal": (context) => Principal(),
        "/cadastro": (context) => Cadastro(),
        "/recuperacao": (context) => Recuperacao(),
      },
    );
  }
}
