class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final double rating;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.rating,
      required this.category,
      required this.availableAddons});
}

// todo: Food Category
enum FoodCategory { burgers, salads, sides, desserts, drinks }

// todo: Food Addons

class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
