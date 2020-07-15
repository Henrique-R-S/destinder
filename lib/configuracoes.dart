import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  double _sliderVal = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        backgroundColor: Colors.lightBlue[700],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                title: Text(
                  "Distância Máxima:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue[700]),
                ),
                subtitle: Slider(
                  value: _sliderVal,
                  min: 5,
                  max: 155.0,
                  divisions: 30,
                  label: '${_sliderVal.round()}Km',
                  onChanged: (double value) {
                    setState(() => _sliderVal = value);
                  },
                ),
                trailing: Text(
                  '${_sliderVal.round()}Km',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Divider(),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: RaisedButton(
                textColor: Colors.lightBlue[700],
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  side: BorderSide(color: Colors.transparent),
                ),
                padding: EdgeInsets.all(0.0),
                child: Text(
                  "Informações do APP".toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  infoDev(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void infoDev(BuildContext context) {
    String texto;
    texto = "Henrique Ribeiro dos Santos\n";
    texto += "\nMatrícula: 2840481821014\n";
    texto += "4º ADS - Manhã\n";
    texto += "FATEC - RP\n\n";
    texto +=
        "Resumo:\n\nEste aplicativo tem a intenção de ser uma paródia do aplicativo Tinder";
    texto +=
        " e o objetivo é notificar as pessoas em tempo real da distância de ";
    texto +=
        "determinados indivíduos que 'não se gostarem'. Isso será implementado";
    texto +=
        " utilizando a tecnologia de GeoFencing para capturar os dados de localização";
    texto += " em tempo real.";

    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text(
          "Desenvolvido por:",
          textAlign: TextAlign.center,
        ),
        content: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/foto_perfil.jpg"),
              radius: 30.0,
            ),
            SizedBox(height: 10.0),
            Text(texto, textAlign: TextAlign.center)
          ],
        ),
        actions: <Widget>[
          BasicDialogAction(
            title: Text("Ok"),
            onPressed: () {
              //deletar o item no Firebase

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
