class Food {
  final String id;
  final String image;
  final String name;
  final int price;
  final double rate;
  final String kcal;
  final String cookingTime;
  final String description;

  Food({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.kcal,
    required this.cookingTime,
    required this.description,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        rate: json["rate"].toDouble(),
        kcal: json["kcal"],
        cookingTime: json["cooking_time"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "price": price,
        "rate": rate,
        "kcal": kcal,
        "cooking_time": cookingTime,
        "description": description,
      };

  static List<String> categories = [
    'All',
    'Fruit',
    'Vegetable',
    'Meat',
    'Dairy',
  ];

  static List<Food> generatedFood = [
    Food(
      id: '1',
      image: 'assets/salad.webp',
      name: 'Salad',
      price: 599,
      rate: 4.5,
      kcal: '150',
      cookingTime: '10 mins',
      description: 'Fresh vegetable salad.',
    ),
    Food(
      id: '2',
      image: 'assets/burger.webp',
      name: 'Burger',
      price: 899,
      rate: 4.7,
      kcal: '600',
      cookingTime: '15 mins',
      description: 'Juicy grilled burger.',
    ),
    // Add more food items here
  ];
}

final dummyFoods = [
  Food(
    id: '1',
    image: 'asset/burger.jpeg',
    name: 'Burger Cheese',
    price: 15,
    rate: 4.5,
    kcal: '100',
    cookingTime: '20 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: '2',
    image: 'asset/pizza.jpeg',
    name: 'Pizza Hots',
    price: 20,
    rate: 4.5,
    kcal: '100',
    cookingTime: '30 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: '3',
    image: 'asset/salad.webp',
    name: 'Salad Health',
    price: 10,
    rate: 4,
    kcal: '20',
    cookingTime: '15 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Food(
    id: '4',
    image: 'asset/salmon.jpeg',
    name: 'Salmon Fresh Mounth',
    price: 12,
    rate: 4.8,
    kcal: '60',
    cookingTime: '18 Min',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
];
