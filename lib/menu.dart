import 'package:flutter/material.dart';
import 'pizza.dart';

class Menu extends StatelessWidget {
  final List<Pizza> pizzas = PizzaMenu.pizzas;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pizzas.length,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
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
            const SizedBox(width: 20.0), // Odstęp między zdjęciem a opisem
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pizzas[index].name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Składniki:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(pizzas[index].ingredients.join(', ')),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // Naciśnięcie przycisku "Konfiguruj"
                        // navigateToConfigurator(context, pizzas[index]);
                      },
                      child: const Text('Konfiguruj'),
                    ),
                    const SizedBox(
                        height: 10.0), // Odstęp między przyciskiem a linią
                    const Divider(
                        height: 1.0,
                        color: Colors.black), // Linia oddzielająca opis pizzy
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
