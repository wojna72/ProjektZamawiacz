import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projekt/configurator.dart';
import 'package:projekt/data/cart.dart';
import 'logowanie.dart'; // Importuje LoginPage z pliku logowanie.dart
import 'menu.dart'; // Importuje Menu z pliku menu.dart
import 'pizza.dart';
import 'cartScreen.dart'; // Importuje CartScreen z pliku cartScreen.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  void login() {
    setState(() {
      isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        primaryColor: Colors.red, // Kolor główny dla AppBar
        scaffoldBackgroundColor: Colors.white, // Kolor tła dla całej aplikacji
      ),
      home: isLoggedIn ? MainScreen() : LoginPage(loginCallback: login),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();   //CODE REVIEW: Moliwa zmiana na StatelessWidget - Stateful nie utrzymuje stanu wewnętrznego
}

class _MainScreenState extends State<MainScreen> {    //CODE REVIEW: Mozna przypisać do padding i text wartość typu const
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75.0), // Wysokość AppBar
          child: Container(
            color: Colors.red, // Kolor tła dla banera
            child: const Center(
              child: Text(
                'Pizza Express',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        body: Menu(),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            child:  const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Go to cart',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                )
              )
            )
          )
        ),
    );
  }
}

//    CODE REVIEW
//
//  Kod czytelny, nasze obiekcje są tylko do niezuywanych importów
//  oraz przeniesienie definicji kolorow do innego pliku w celu dalszej modyfikacji motywu
//
// ******************************************************************

