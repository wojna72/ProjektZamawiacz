class Ingredient {
  final String name;
  final String
      category; // Category of the ingredient, e.g., "Meat", "Vegetable", "Cheese", etc.
  final double pricePerUnit; // Price per unit (e.g., per gram, per piece, etc.)

  const Ingredient(this.name, this.category, this.pricePerUnit);
}

enum IngredientType {
  tomatoSauce,
  mozzarellaCheese,
  basil,
  pepperoni,
  mixedVegetables,
}

class IngredientMenu {
  static const List<Ingredient> ingredients = [
    Ingredient('Tomato Sauce', 'Sauce', 0.05),
    Ingredient('Mozzarella Cheese', 'Cheese', 0.1),
    Ingredient('Basil', 'Vegetable', 0.02),
    Ingredient('Pepperoni', 'Meat', 0.15),
    Ingredient('Mixed Vegetables', 'Vegetable', 0.08),
  ];

  static Ingredient getIngredient(IngredientType type) {
    switch (type) {
      case IngredientType.tomatoSauce:
        return ingredients[0];
      case IngredientType.mozzarellaCheese:
        return ingredients[1];
      case IngredientType.basil:
        return ingredients[2];
      case IngredientType.pepperoni:
        return ingredients[3];
      case IngredientType.mixedVegetables:
        return ingredients[4];
      default:
        return ingredients[0];
    }
  }
}

class Pizza {
  String name;
  List<Ingredient> ingredients;
  double price;
  PizzaSize size = PizzaSize.medium;
  String imageUrl;

  Pizza(this.name, this.ingredients, this.price, this.size, this.imageUrl);
}

enum PizzaSize { small, medium, large }

enum PizzaType { margherita, pepperoni, vegetarian }

class PizzaMenu {
  static List<Pizza> pizzas = [
    Pizza(
        'Margherita',
        [
          IngredientMenu.getIngredient(IngredientType.tomatoSauce),
          IngredientMenu.getIngredient(IngredientType.mozzarellaCheese),
          IngredientMenu.getIngredient(IngredientType.basil)
        ],
        8.99,
        PizzaSize.medium,
        'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
    Pizza(
        'Pepperoni',
        [
          IngredientMenu.getIngredient(IngredientType.tomatoSauce),
          IngredientMenu.getIngredient(IngredientType.mozzarellaCheese),
          IngredientMenu.getIngredient(IngredientType.pepperoni)
        ],
        10.99,
        PizzaSize.medium,
        'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
    Pizza(
        'Vegetarian',
        [
          IngredientMenu.getIngredient(IngredientType.tomatoSauce),
          IngredientMenu.getIngredient(IngredientType.mozzarellaCheese),
          IngredientMenu.getIngredient(IngredientType.basil),
          IngredientMenu.getIngredient(IngredientType.mixedVegetables)
        ],
        9.99,
        PizzaSize.medium,
        'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
    Pizza(
        'Hawaian (BAD PIZZA! DON\'T ORDER)',
        [
          IngredientMenu.getIngredient(IngredientType.tomatoSauce),
          IngredientMenu.getIngredient(IngredientType.mozzarellaCheese),
          IngredientMenu.getIngredient(IngredientType.basil),
          IngredientMenu.getIngredient(IngredientType.mixedVegetables)
        ],
        9.99,
        PizzaSize.medium,
        'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg'),
  ];

  static Pizza getPizza(PizzaType type) {
    switch (type) {
      case PizzaType.margherita:
        return pizzas[0];
      case PizzaType.pepperoni:
        return pizzas[1];
      case PizzaType.vegetarian:
        return pizzas[2];
      default:
        return pizzas[0];
    }
  }
}

//CODE REVIEW:
// Na pierwszy rzut oka jasno i klarownie widać co opisuje ten plik .dart
// Osobiscie zaproponujemy uzycie zamiast gotowych obrazkow - tych dostepnych z lorem picsum
// Zalety kodu to z pewnością przypisanie skladnikom wartosci const, 
// Sugestia poprawy funkcjonalności ingredients o aktualnie brakujace skladniki w restauracji.