import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          toolbarHeight: 90,
          title: const Text("LOGIN IPET"),
          centerTitle: true,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginTXT = TextEditingController();
  final senhaTXT = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                  controller: loginTXT,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Login',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o seu login';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                  controller: senhaTXT,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Senha',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite a sua senha';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.10),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(350, 40),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            // ignore: prefer_const_constructors
                            SnackBar(
                              // ignore: prefer_const_constructors
                              content: Text('Login efetuado com sucesso'),
                            ),
                          );
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => MyApp()));
                        }
                      },
                      child: const Text('Acessar'),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
