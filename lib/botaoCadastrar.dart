import 'package:flutter/material.dart';

botaoCadastrar(BuildContext context, rotulo) {
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
