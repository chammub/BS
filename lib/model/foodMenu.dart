class FoodMenu {
  final String id;
  final String name;
  final String count;
  final String icon;
  final String duration;
  final String minOrder;
  final String foodType;

  const FoodMenu(
      {this.id,
      this.name,
      this.count,
      this.icon,
      this.duration,
      this.minOrder,
      this.foodType});
}

List<FoodMenu> foodMenuList = [
  const FoodMenu(
      id: "1",
      name: "Pizza",
      count: "5",
      icon: "ic_food_menu_pizza.png",
      duration: "20 mins",
      minOrder: "250",
      foodType: "VEG"),
  const FoodMenu(
      id: "2",
      name: "Burger",
      count: "7",
      icon: "ic_food_menu_burger.png",
      duration: "15 mins",
      minOrder: "275",
      foodType: "VEG"),
  const FoodMenu(
      id: "3",
      name: "Mexican",
      count: "2",
      icon: "ic_food_menu_mexican.png",
      duration: "25 mins",
      minOrder: "215",
      foodType: "VEG"),
  const FoodMenu(
      id: "4",
      name: "Italian",
      count: "9",
      icon: "ic_food_menu_italian.png",
      duration: "20 mins",
      minOrder: "150",
      foodType: "VEG")
];
