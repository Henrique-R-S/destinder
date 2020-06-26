import 'package:flutter/material.dart';

alerta(BuildContext context, titulo, conteudo) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(conteudo),
        actions: <Widget>[
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}
