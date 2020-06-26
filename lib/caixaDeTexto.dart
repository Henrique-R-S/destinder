import 'package:flutter/material.dart';

caixaDeTexto(rotulo, controle, tipo, icone, obscuro) {
  return Container(
    height: 60.0,
    child: TextFormField(
      // Valida a entrada
      validator: (value) {
        return (value.isEmpty) ? "Insira seus dados!" : null;
      },
      obscureText: obscuro,
      controller: controle,
      keyboardType: tipo,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        icon: Icon(
          icone,
          color: Colors.white,
        ),
        labelText: rotulo,
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
  );
}
