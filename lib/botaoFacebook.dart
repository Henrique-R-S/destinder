import 'package:flutter/material.dart';

botaoFacebook(BuildContext context, rotulo) {
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
