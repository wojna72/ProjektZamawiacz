import 'package:flutter/material.dart';
import 'register.dart'; // Importuje ekran rejestracji

class LoginPage extends StatelessWidget {
  final VoidCallback loginCallback;

  LoginPage({required this.loginCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Logowanie',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Podaj login',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Podaj hasło',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: loginCallback,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Zaloguj'),
            ),
            SizedBox(height: 20.0), // Odstęp między przyciskiem a tekstem rejestracji
            GestureDetector(
              onTap: () {
                // Przekierowanie do ekranu rejestracji
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RejestracjaPage()),
                );
              },
              child: Text(
                'Nie masz jeszcze konta? Zarejestruj się',
                style: TextStyle(
                  color: Colors.blue, // Kolor tekstu na niebieski
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline, // Podkreślenie tekstu
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
