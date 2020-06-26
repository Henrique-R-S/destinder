import 'package:flutter/material.dart';

botaoGoogle(BuildContext context, rotulo) {
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
