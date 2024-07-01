import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:new_restaurant_app/models/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // TODO : list of food menu

  final List<Food> _menu = [
    // Burger
    Food(
        name: "Classic Cheeseburger",
        description:
            "This burger starts with a toasted sesame seed bun, wrapped around a perfectly seasoned, mouth-watering hamburger, topped with your favorite cheese, crisp onion, lettuce, juicy tomato, pickles, ketchup, and mustard!",
        imagePath: "assets/images/burgers2.png",
        price: 0.99,
        rating: 4,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra Cheese ", price: 0.99),
          Addon(name: "Bacon ", price: 1.99),
          Addon(name: "Avocado ", price: 2.99),
        ]),
    Food(
        name: "BBQ Bacon Burger",
        description:
            "Let's just say it: Barbecue bacon burgers are spectacular. When a juicy beef burger is covered in melted spicy cheese, slathered with barbecue sauce, topped with strips of crunchy bacon and stacked high with onion rings",
        imagePath: "assets/images/burgers1.png",
        price: 10.99,
        rating: 3,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Grilled Onions", price: 0.99),
          Addon(name: "Jalapenos ", price: 1.49),
          Addon(name: "Extra BBQ Sauce ", price: 2.99),
        ]),
    Food(
        name: "Veggie Burger",
        description:
            "A veggie burger is a hamburger made with a patty that does not contain meat, or the patty of such a hamburger. The patty may be made from ingredients like beans (especially soybeans and tofu), nuts, grains, seeds, or fungi such as mushrooms or mycoprotein.",
        imagePath: "assets/images/burgers3.png",
        price: 0.99,
        rating: 3.5,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Vegan Cheese", price: 0.99),
          Addon(name: "Grilled Mushrooms ", price: 1.99),
          Addon(name: "Hummus Spread ", price: 2.99),
        ]),
    Food(
        name: "Aloha Burger",
        description:
            "Aloha burger – juicy cheeseburger topped with grilled pineapple and crispy bacon. Add honey mustard sauce and what you have is an aloha burger recipe that's almost as good as Jollibee's!",
        imagePath: "assets/images/burgers4.png",
        price: 0.99,
        rating: 4.5,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Teriyaki Glaze", price: 0.99),
          Addon(name: "Extra Pineapple ", price: 3.39),
          Addon(name: "Bacon", price: 1.49),
        ]),
    Food(
        name: "Blue Moon Burger",
        description:
            "A burger is a patty of ground beef grilled and placed between two halves of a bun. Slices of raw onion, lettuce, bacon, mayonnaise, and other ingredients add flavor. Burgers are considered an American food but are popular around the world. In Japan, teriyaki burgers ",
        imagePath: "assets/images/burgers5.png",
        price: 0.99,
        rating: 4,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Sauteed Mushrooms ", price: 0.99),
          Addon(name: "Fried Egg ", price: 1.99),
          Addon(name: "Spicy Mayo ", price: 2.99),
        ]),

    // Salad
    Food(
        name: "Caesar Salad",
        description:
            "Caesar salad is made with romaine lettuce, croutons, Parmesan cheese, and Caesar dressing. The dressing is a mixture of olive oil, lemon juice, Worcestershire sauce, Dijon mustard, and garlic. Tip: Skip the shaky cheese.",
        imagePath: "assets/images/Salad1.png",
        price: 7.99,
        rating: 5,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Grilled Chicken", price: 0.99),
          Addon(name: "Anchovies", price: 1.99),
          Addon(name: "Extra Parmesan", price: 2.99),
        ]),
    Food(
        name: "Greek Salad",
        description:
            "Greek salad, or horiatiki salata, is a rough country salad of juicy tomatoes, crisp cucumber, sliced red onion, green pepper, crumbly feta cheese and plump Kalamata olives.",
        imagePath: "assets/images/Salad2.png",
        price: 0.99,
        rating: 4,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Feta Cheese ", price: 0.99),
          Addon(name: "Kamala Olives ", price: 1.49),
          Addon(name: "Grilled Shrimp ", price: 2.39),
        ]),
    Food(
        name: "Quinoa Salad",
        description:
            "It's made simply with fresh cucumber, red bell pepper, red onion, chickpeas, fresh parsley and a garlicky olive oil and lemon dressing. ",
        imagePath: "assets/images/Salad3.png",
        price: 0.99,
        rating: 3,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Avocado", price: 0.99),
          Addon(name: "Feta Cheese ", price: 1.99),
          Addon(name: "Grilled ChicKen ", price: 2.99),
        ]),
    Food(
        name: "Asian Sesame Salad",
        description:
            "Grilled chicken, iceberg lettuce, mandarin oranges, shredded carrots, crunchy rice noodles, slivered almonds, and sesame seeds. ",
        imagePath: "assets/images/Salad4.png",
        price: 9.99,
        rating: 4.5,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Mandarin Oranges ", price: 0.99),
          Addon(name: "Almond Slivers ", price: 1.99),
          Addon(name: "Extra Teriyaki Chicken ", price: 2.99),
        ]),
    Food(
        name: "South West Chicken Salad",
        description:
            "Be the first to rate & review! Romaine is topped with grilled chicken, corn, beans, tomatoes, and onions, and drizzled with a creamy avocado ranch dressing. ",
        imagePath: "assets/images/Salad5.png",
        price: 5.99,
        rating: 3,
        category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Sour Cream ", price: 0.99),
          Addon(name: "Pico de Gallo ", price: 1.99),
          Addon(name: "Guacamole ", price: 2.99),
        ]),

    // sides
    Food(
        name: "Sweet Potato Fries",
        description:
            "Fried sweet potato features in a variety of dishes and cuisines including the popular sweet potato fries, a variation of French fries using sweet potato instead of potato.",
        imagePath: "assets/images/sides2.png",
        price: 7.99,
        rating: 4,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Cheese Sauce", price: 0.99),
          Addon(name: "Truffle Oil", price: 1.99),
          Addon(name: "Cajun Spice", price: 2.99),
        ]),
    Food(
        name: "Onion Rings",
        description:
            "Onion rings (also called French-fried onion rings) is a form of appetizer or side dish in British and American cuisine.",
        imagePath: "assets/images/sides4.png",
        price: 3.99,
        rating: 3.5,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Ranch Dip", price: 0.99),
          Addon(name: "Spicy Mayo", price: 1.99),
          Addon(name: "Parmesan Dust", price: 2.99),
        ]),
    Food(
        name: "Garlic Bread",
        description:
            "Garlic bread (also called garlic toast) consists of bread (usually a baguette, sour dough, or bread such as ciabatta), ",
        imagePath: "assets/images/sides5.png",
        price: 7.99,
        rating: 4,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra Garlic", price: 0.99),
          Addon(name: "Mozzarella Cheese", price: 1.99),
          Addon(name: " Marinara Dip", price: 2.99),
        ]),
    Food(
        name: "Loaded Sweet Potato Fires",
        description:
            "Crisp sweet potato fries loaded with spicy chicken, peppers, cheese and all the sauces. The perfect weekend treat! You can make your own chilli sauce or use shop-bought.",
        imagePath: "assets/images/sides1.png",
        price: 7.99,
        rating: 2,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Sour Cream", price: 0.99),
          Addon(name: "Bacon Bits", price: 1.99),
          Addon(name: "Green Onions", price: 2.99),
        ]),
    Food(
        name: "Crispy Mac & Cheese Bites",
        description:
            "Just when you think macaroni and cheese can't get any better, enter crispy, fried homemade mac and cheese bites! Filled with creamy, cheesy macaroni noodles, the balls are coated in panko breadcrumbs and deep-fried to extra-crispy perfection.",
        imagePath: "assets/images/sides3.png",
        price: 7.99,
        rating: 4,
        category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Bacon Bits", price: 0.99),
          Addon(name: "Jalapeno Slices", price: 1.99),
          Addon(name: "Sriracha Drizzle", price: 2.99),
        ]),

    // dessert
    Food(
        name: "Chocolate Brownie",
        description:
            "A chocolate brownie, or simply a brownie, is a chocolate baked confection. Brownies come in a variety of forms and may be either fudgy or cakey, depending on their density.",
        imagePath: "assets/images/dessert1.png",
        price: 7.99,
        rating: 4,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Vanilla Ice Cream", price: 0.99),
          Addon(name: "Hot Fudge", price: 1.99),
          Addon(name: "Whipped Cream", price: 2.99),
        ]),
    Food(
        name: "CheeseCake",
        description:
            "Cheesecake is a dessert made with a soft fresh cheese (typically cottage cheese, cream cheese, quark or ricotta), eggs, and sugar.",
        imagePath: "assets/images/dessert2.png",
        price: 6.99,
        rating: 3,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Strawberry Topping", price: 0.99),
          Addon(name: "Blueberry Compote", price: 1.99),
          Addon(name: "Chocolate Chips", price: 2.99),
        ]),
    Food(
        name: "Apple Pie",
        description:
            "Modern American recipes for apple pie usually indicate a pastry that is 9 inches in diameter in a fluted pie plate,",
        imagePath: "assets/images/dessert3.png",
        price: 5.49,
        rating: 3.5,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Caramel Sauce", price: 0.99),
          Addon(name: "Vanilla Ice Cream", price: 1.99),
          Addon(name: "Cinnamon Spice", price: 2.99),
        ]),
    Food(
        name: "Apple Pie",
        description:
            "Modern American recipes for apple pie usually indicate a pastry that is 9 inches in diameter in a fluted pie plate,",
        imagePath: "assets/images/dessert4.png",
        price: 5.49,
        rating: 2.5,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Caramel Sauce", price: 0.99),
          Addon(name: "Vanilla Ice Cream", price: 1.99),
          Addon(name: "Cinnamon Spice", price: 2.99),
        ]),
    Food(
        name: "Red Velvet Cake",
        description:
            "Red velvet cake falls somewhere between white cake and chocolate cake on the flavor spectrum.",
        imagePath: "assets/images/dessert5.png",
        price: 5.49,
        rating: 4,
        category: FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Raspberry Sauce", price: 0.99),
          Addon(name: "Cream Cheese Icing", price: 1.99),
          Addon(name: "Chocolate Sprinkles", price: 2.99),
        ]),

    // drinks
    Food(
        name: "Lemonade",
        description:
            "Lemonade is a clear, sweet, fizzy drink, or a drink that is made from lemons, sugar, and water.",
        imagePath: "assets/images/drinks1.png",
        price: 2.19,
        rating: 5,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Strawberry Flavor", price: 0.99),
          Addon(name: "Mint Leaves", price: 1.99),
          Addon(name: "Ginger Zest", price: 2.99),
        ]),
    Food(
        name: "Iced Tea",
        description:
            "Iced tea (or ice tea) is a form of cold tea. Though it is usually served in a glass with ice, it can refer to any tea that has been chilled or cooled. It may be sweetened with sugar or syrup.",
        imagePath: "assets/images/drinks4.png",
        price: 2.19,
        rating: 3,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Peach Flavor", price: 0.99),
          Addon(name: "Lemon Slices", price: 1.99),
          Addon(name: "Honey", price: 2.99),
        ]),
    Food(
        name: "Smoothie",
        description:
            "A smoothie is a beverage made by puréeing ingredients in a blender. A smoothie commonly has a liquid base, such as fruit juice or milk, yogurt or ice cream.",
        imagePath: "assets/images/drinks3.png",
        price: 4.59,
        rating: 4,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Protein Powder", price: 0.99),
          Addon(name: "Almond Milk", price: 1.99),
          Addon(name: "Chia Seeds", price: 2.99),
        ]),
    Food(
        name: "Mojito",
        description:
            "The classic rum smash and everyone's favourite minty cocktail, the Mojito is made from fresh mint, muddled limes, ",
        imagePath: "assets/images/drinks5.png",
        price: 4.59,
        rating: 4.5,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Mint", price: 0.99),
          Addon(name: "Raspberry Puree", price: 1.99),
          Addon(name: "Splash of Coconut Rum", price: 2.99),
        ]),
    Food(
        name: "Caramel Macchiato",
        description:
            "Our Caramel Macchiato is an indulgent blend of bold espresso, creamy milk and buttery, sweet caramel flavour.",
        imagePath: "assets/images/drinks2.png",
        price: 4.99,
        rating: 5,
        category: FoodCategory.drinks,
        availableAddons: [
          Addon(name: "Extra Shot of Espresso", price: 0.99),
          Addon(name: "Hazelnut Syrup", price: 1.99),
          Addon(name: "Whipped Cream", price: 2.99),
        ]),
  ];

  // TODO: user cart
  final List<CartItem> _cart = [];

  //TODO: delivery address

  String _deliveryAddress = 'Saeed Street - tanta';

  // G E T T E R S

  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  // O P E R A T I O N S

  //TODO: add to cart
  void addToCart(Food food, List<Addon> selectAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectAddons, selectAddons);

      return isSameFood && isSameAddons;
    });

    // if item is already exists
    if (cartItem != null) {
      cartItem.quantity++;
    }

    // add a new cart item to the cart
    else {
      _cart.add(CartItem(
        food: food,
        selectAddons: selectAddons,
      ));
    }
    notifyListeners();
  }

  //TODO:  remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //todo: get total price
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //todo: get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //todo: clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // TODO: update Delivery Address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  // H E L P E R S

  //todo: generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    // format the date ti include up to seconds only
    String formattedDate =
        DateFormat('yyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("---------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} * ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectAddons.isNotEmpty) {
        receipt.writeln("   Add-ons:  ${_formatAddon(cartItem.selectAddons)} ");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivery to: $deliveryAddress");
    return receipt.toString();
  }

  // todo: format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //todo:  format list of addons into a string summary
  String _formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
