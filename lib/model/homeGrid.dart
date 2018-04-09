class HomeGrid {
  final String id;
  final String name;
  final String icon;
  final int count;

  const HomeGrid({this.id, this.name, this.icon, this.count});
}

List<HomeGrid> homeGridList = [
  const HomeGrid(id: "1", name: "FOOD", icon: "ic_food.png", count: 0),
  const HomeGrid(id: "2", name: "TEXTILE", icon: "ic_textile.png", count: 1),
  const HomeGrid(id: "3", name: "MATTRESS", icon: "ic_mattress.png", count: 2),
  const HomeGrid(id: "4", name: "ABOUT", icon: "ic_about.png", count: 3)
];
