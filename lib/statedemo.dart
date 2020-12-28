import 'package:flutter/material.dart';

class StateDemo extends StatefulWidget {
  @override
  _StateDemoState createState() => _StateDemoState();
}

class _StateDemoState extends State<StateDemo> {
  bool ativo = false;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Wrap - Demo"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Transform.scale(
                  scale: 2.0,
                  child: Switch(
                      value: ativo,
                      onChanged: (value) {
                        setState(() {
                          ativo = value;
                        });
                      })),
              Icon(
                ativo ? Icons.lightbulb : Icons.lightbulb_outline,
                size: 100,
                color: ativo ? Colors.yellow : Colors.black,
              ),
              Divider(
                height: 100,
                color: Colors.black,
                thickness: 3,
              ),
              RaisedButton(
                  child: Text("Mostrar mensagem", style: TextStyle(color: Colors.white, fontSize: 20),),
                  color: Colors.purple[900],
                  onPressed: () {
                    _scaffoldKey.currentState.showSnackBar(_mensagem("Mensagem de teste"));
                  }),
            ],
          ),
        ],
      ),
    );
}
    SnackBar _mensagem(String texto) {
      return SnackBar(
        content: Text(texto),
        backgroundColor: Colors.blue[900],
        duration: Duration(seconds: 3),
      );
    }
  }
