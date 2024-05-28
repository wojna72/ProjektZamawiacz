import 'package:flutter/material.dart';

import 'data/cart.dart';
import 'pizza.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ValueListenableBuilder<List<Pizza>> (
        valueListenable: Cart.pizzasNotifier,
        builder: (context, pizzas, child) {
          return ListView.builder(
            itemCount: pizzas.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  pizzas[index].imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(pizzas[index].name),
                subtitle: Text('Price: ${pizzas[index].price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Cart.removeFromCart(pizzas[index]);
                  },
                ),
              );
            },
          );
        }
      ),
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
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cart value: ${Cart.calculateTotalPrice()}',
                style: const TextStyle(
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