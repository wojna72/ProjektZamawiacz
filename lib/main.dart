import 'package:flutter/material.dart';
import 'logowanie.dart'; // Importuje LoginPage z pliku logowanie.dart

void main() {
  runApp(MyApp());
}

class Pizza {
  final String name;
  final List<String> ingredients;
  final String imageUrl;

  Pizza(this.name, this.ingredients, this.imageUrl);
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
  final List<Pizza> pizzas = [
     Pizza(
        'Pizza Margherita',
        ['Sos pomidorowy', 'Mozzarella', 'Bazylia'],
        'https://assets.tmecosys.com/image/upload/t_web600x528/img/recipe/ras/Assets/4F1526F0-0A46-4C87-A3D5-E80AD76C0D70/Derivates/0A2B6AEB-72A5-4CE4-911B-0222E765DAA3.jpg',
      ),
      Pizza(
        'Pizza Pepperoni',
        ['Sos pomidorowy', 'Mozzarella', 'Pepperoni'],
        'https://v.wpimg.pl/MTI5Ny5qYjUoVzhKGgpvIGsPbBBcU2F2PBd0WxpBNWBxBWEJRx4pISpBPVdCAS4wJxs-FRoBJTs9Wj1WB0B_bX4bJAlSUzA',
      ),
      Pizza(
        'Pizza Hawajska',
        ['Sos pomidorowy', 'Mozzarella', 'Szynka', 'Ananas'],
        'https://pliki.doradcasmaku.pl/pizza-hawajska52-4.webp',
      ),
      Pizza(
        'Pizza Wegetariańska',
        ['Sos pomidorowy', 'Mozzarella', 'Papryka', 'Pieczarki', 'Oliwki'],
        '',
      ),
      Pizza(
        'Pizza Morska',
        ['Sos pomidorowy', 'Mozzarella', 'Owoce morza'],
        'https://cdn.pixabay.com/photo/2017/05/07/08/56/food-2292265_1280.jpg',
      ),
      Pizza(
        'Pizza Capricciosa',
        ['Sos pomidorowy', 'Mozzarella', 'Szynka', 'Pieczarki', 'Oliwki', 'Karczochy'],
        'https://cdn.pixabay.com/photo/2016/07/29/15/25/pizza-1552932_1280.jpg',
      ),
      Pizza(
        'Pizza Quattro Stagioni',
        ['Sos pomidorowy', 'Mozzarella', 'Szynka', 'Pieczarki', 'Oliwki', 'Karczochy', 'Owoce morza'],
        'https://cdn.pixabay.com/photo/2017/01/03/11/33/pizza-1949189_1280.jpg',
      ),
      Pizza(
        'Pizza Diavola',
        ['Sos pomidorowy', 'Mozzarella', 'Pepperoni', 'Papryczki chili'],
        'https://cdn.pixabay.com/photo/2016/05/07/15/50/pizza-1370912_1280.jpg',
      ),
      Pizza(
        'Pizza Quattro Formaggi',
        ['Sos pomidorowy', 'Mozzarella', 'Parmezan', 'Gorgonzola', 'Gouda'],
        'https://cdn.pixabay.com/photo/2016/01/21/18/42/pizza-1150037_1280.jpg',
      ),
      Pizza(
        'Pizza Prosciutto e Funghi',
        ['Sos pomidorowy', 'Mozzarella', 'Szynka', 'Pieczarki'],
        'https://cdn.pixabay.com/photo/2017/09/27/16/29/pizza-2798669_1280.jpg',
      ),
      Pizza(
        'Pizza Calzone',
        ['Sos pomidorowy', 'Mozzarella', 'Szynka', 'Pieczarki', 'Papryka'],
        'https://cdn.pixabay.com/photo/2016/11/29/12/54/bread-1868918_1280.jpg',
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0), // Wysokość AppBar
        child: Container(
          color: Colors.red, // Kolor tła dla banera
          child: Center(
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
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    pizzas[index].imageUrl,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20.0), // Odstęp między zdjęciem a opisem
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        pizzas[index].name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Składniki:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(pizzas[index].ingredients.join(', ')),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          // Naciśnięcie przycisku "Konfiguruj"
                          // navigateToConfigurator(context, pizzas[index]);
                        },
                        child: Text('Konfiguruj'),
                      ),
                      SizedBox(height: 10.0), // Odstęp między przyciskiem a linią
                      Divider(height: 1.0, color: Colors.black), // Linia oddzielająca opis pizzy
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
