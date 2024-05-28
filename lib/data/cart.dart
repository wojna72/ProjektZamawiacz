import 'package:flutter/material.dart';
import 'package:projekt/pizza.dart';

class Cart {
  static List<Pizza> pizzas = [];
  static ValueNotifier<List<Pizza>> pizzasNotifier = ValueNotifier(pizzas);

  static void addToCart(Pizza pizza) {
    pizzas.add(pizza);
    pizzasNotifier.value = pizzas;
  }

  static void removeFromCart(Pizza pizza) {
    pizzas.remove(pizza);
    pizzasNotifier.value = pizzas;
  }

  static double calculateTotalPrice() {
    return pizzas.fold(0, (sum, pizza) => sum + pizza.price);
  }
}