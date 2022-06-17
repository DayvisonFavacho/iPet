import 'package:flutter/material.dart';
import 'package:untitled/functions/petsPerdidos.dart';
import 'package:untitled/util/sessao.dart';

class Lista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage());
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List<String> pets = sessao.petsPerdidos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              // ignore: unnecessary_new
              new SizedBox(
                width: double.infinity,
            height: 50,
                child: ElevatedButton(
                  child: const Text('ATUALIZAR LISTA'),
                  onPressed:() {
                  petsPerdidos(context);
                    Future.delayed(const Duration(milliseconds: 700), () {
          setState(() {
            pets = sessao.petsPerdidos;
          });
        });},
                ),
              ),

              Expanded(
                child: ListView.separated(
            itemBuilder: (BuildContext, index) {
                return ListTile(
                  title: Text("Nome: "+pets[index]),
                  subtitle:
                  Text("Visite o site para entrar em contato"),
                );
            },
            separatorBuilder: (BuildContext, index) {
                return Divider(height: 1);
            },
            itemCount: pets.length,
            shrinkWrap: true,
            padding: EdgeInsets.all(5),
            scrollDirection: Axis.vertical,
          ),
              ),
        ]));
  }
}