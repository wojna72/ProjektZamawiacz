import 'package:flutter/material.dart';
import 'package:projekt/data/cart.dart';
import 'pizza.dart';

class PizzaConfigurator extends StatefulWidget {
  final Pizza pizza;

  const PizzaConfigurator({Key? key, required this.pizza}) : super(key: key);

  @override
  _PizzaConfiguratorState createState() => _PizzaConfiguratorState();
}

class _PizzaConfiguratorState extends State<PizzaConfigurator> {
  Pizza pizza = PizzaMenu.getPizza(PizzaType.margherita);

  @override
  void initState() {
    super.initState();
    pizza = widget.pizza;
  }

  void _toggleIngredient(Ingredient ingredient) {
    setState(() {
      if (pizza.ingredients.contains(ingredient)) {
        pizza.ingredients.remove(ingredient);
      } else {
        pizza.ingredients.add(ingredient);
      }
    });
  }

  calculateTotalPrice() {
    // Calculate total price based on selected ingredients and size
    return pizza.price +
        pizza.ingredients
            .fold(0, (sum, ingredient) => sum + ingredient.pricePerUnit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configure ${pizza.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              pizza.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Choose Size:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Optimize this part by using a loop
            ListTile(
              title: const Text('Small'),
              leading: Radio(
                value: PizzaSize.small,
                groupValue: pizza.size,
                onChanged: (PizzaSize? value) {
                  setState(() {
                    pizza.size = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Medium'),
              leading: Radio(
                value: PizzaSize.medium,
                groupValue: pizza.size,
                onChanged: (PizzaSize? value) {
                  setState(() {
                    pizza.size = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Large'),
              leading: Radio(
                value: PizzaSize.large,
                groupValue: pizza.size,
                onChanged: (PizzaSize? value) {
                  setState(() {
                    pizza.size = value!;
                  });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Choose Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Wrap(
              children: IngredientMenu.ingredients.map((ingredient) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilterChip(
                    label: Text(ingredient.name),
                    selected: pizza.ingredients.contains(ingredient),
                    onSelected: (selected) {
                      _toggleIngredient(ingredient);
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Price: \$${calculateTotalPrice()}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Cart.addToCart(pizza);
                  Navigator.pop(context);
                  print(Cart.calculateTotalPrice());
                },
                child: const Text('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//CODE REVIEW:
// Dobrze zdefiniowane api calculateTotalPrice i ToggleIngredient 
// Wysoka czytelność kodu
// Sugerowane poprawki to optymalizacja wyboru rozmiaru - mozliwosc zawarcia jej w petli
// Formatowanie ceny aby wyswietlala sie w sposob sformatowany do dwoch miejsc po przecinku