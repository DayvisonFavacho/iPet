import 'package:flutter/material.dart';
import 'package:untitled/cadastro.dart';
import 'package:untitled/lista.dart';
import 'package:untitled/util/sessao.dart';
import 'package:untitled/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Seja bem vindo(a) ao iPet',
      style: optionStyle,
    ),
    Cadastro(),
    Lista(),
    Text(
      'www.ipet.com.br',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.network('https://cdn.shopify.com/s/files/1/0269/5344/9533/files/iPET_With_R_500x.png?v=1588312178', width: 150,),
        centerTitle: true,
        toolbarHeight: 100,
        shadowColor: Colors.yellowAccent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://png.pngtree.com/background/20210711/original/pngtree-pet-simple-white-banner-picture-image_1064801.jpg'),
                  fit: BoxFit.fill
              )
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://www.conveniomedicoveterinario.com.br/wp-content/uploads/2020/05/bg-medicina-com-carinho.jpg',
              ),
            )),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));},
        tooltip: 'LOGIN',
        backgroundColor: Colors.orange,
        child: Icon(Icons.person),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.limeAccent,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Cadastrar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows),
            label: 'Site',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
