import 'package:flutter/material.dart';
import 'logowanie.dart'; // Importuje LoginPage z pliku logowanie.dart
import 'configurator.dart';
import 'pizza.dart';

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

class MainScreen extends StatelessWidget {
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
        body:
            PizzaConfigurator(pizza: PizzaMenu.getPizza(PizzaType.margherita)));
  }
}
