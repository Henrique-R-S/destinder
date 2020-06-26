import 'package:flutter/material.dart';
import 'package:projeto/dadosUsuario.dart';
import 'package:projeto/alerta.dart';

botaoLogin(BuildContext context, rotulo, email, senha, _formKey) {
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
        //  Criar OBJ contendo dados pra outra tela
        try {
          var obj = Mensagem(email, senha);
          if (_formKey.currentState.validate()) {
            Navigator.pushNamed(context, "/perfil", arguments: obj);
          } else {
            FocusScope.of(context).requestFocus(new FocusNode());
            alerta(context, "Dados inválidos!", "Por favor tente novamente.");
          }
        } catch (_) {
          throw Exception("Erro");
        }
      },
      padding: EdgeInsets.all(0.0),
    ),
  );
}
