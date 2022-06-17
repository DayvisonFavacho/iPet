import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:untitled/lista.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

class Cadastro extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(child: MyStatefulWidget()),
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
  final nomeTXT = TextEditingController();
  final petTXT = TextEditingController();
  final racaTXT = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
        ),
        const Center(
          child: Text(
            'Dados do pet perdido e de seu dono',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                  controller: nomeTXT,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Seu nome',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o seu nome';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                  controller: petTXT,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Nome do PET',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o nome do PET';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                  controller: racaTXT,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Raça',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite a raça do seu PET';
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
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        if (_formKey.currentState!.validate()) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            // ignore: prefer_const_constructors
                            SnackBar(
                              // ignore: prefer_const_constructors
                              content: Text('PET CADASTRADO COM SUCESSO, SQN'),
                            ),
                          );
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Lista()));

                        }
                      },
                      child: const Text('Cadastrar'),
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}