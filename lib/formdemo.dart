import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  TextEditingController _eLogin = new TextEditingController();
  TextEditingController _eSenha = new TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();
  String login;
  String senha;
  bool logado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap - Demo"),
      ),
      body: ListView(
        children: [
          Form(
            key: _loginFormKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Usuario"),
                  controller: _eLogin,
                  onChanged: (valor) {
                    login = valor;
                  },
                  validator: (valor) {
                    if (valor.isEmpty) {
                      return "Login obrigatória";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Senha"),
                  obscureText: true,
                  controller: _eSenha,
                  onChanged: (valor) {
                    senha = valor;
                  },
                  validator: (valor) {
                    if (valor.isEmpty) {
                      return "Senha obrigatória";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          RaisedButton(
              child: Text(
                "Fazer login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.purple[900],
              onPressed: () {
                if (_loginFormKey.currentState.validate()) {
                  setState(() {
                    logado = true;
                  });
                } else {
                  setState(() {
                    logado = false;
                  });
                }
              }),
          Visibility(
            visible: logado,
            child: Text(
              "Você foi logado com o login ${_eLogin.text}\n e com a senha $senha",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
