import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:untitled/util/sessao.dart';

void petsPerdidos(BuildContext context) async {
  ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text('Baixando lista')));

  final response = await http.get(
      Uri.parse(
          'https://jsonplaceholder.typicode.com/todos/')
      );

  var result = json.decode(response.body);

  print(response.statusCode);

  var petsPerdidos = [""];

  if (response.statusCode == 200) {
    for (int i = 0; i < result.length; i++) {
      petsPerdidos.add(result[i]['title'].toString());
    }
    sessao.petsPerdidos = petsPerdidos;
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('ERRO AO IMPORTAR')));
  }
}