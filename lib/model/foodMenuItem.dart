class FoodMenuModelItem {
  String id;
  String name;
  String category;
  int price;
  double gst;
  int rating;
  bool discount;
  double discountPrice;
  bool banner;
  bool exclusiveBanner;
  bool newBanner;
  bool mustTryBanner;
  String foodType;
  int orderCount;

  FoodMenuModelItem(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.gst,
      this.rating,
      this.discount,
      this.discountPrice,
      this.banner,
      this.exclusiveBanner,
      this.newBanner,
      this.mustTryBanner,
      this.foodType,
      this.orderCount});
}

List<FoodMenuModelItem> foodMenuModelItemList = [
  // pizza
  FoodMenuModelItem(
      id: "1",
      name: "Chic-Choc Pizza",
      category: "Pizza",
      price: 149,
      gst: 10.0,
      rating: 4,
      discount: false,
      discountPrice: 0.0,
      banner: true,
      exclusiveBanner: true,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "2",
      name: "Maharaja Panner Pizza",
      category: "Pizza",
      price: 169,
      gst: 10.0,
      rating: 4,
      discount: false,
      discountPrice: 0.0,
      banner: true,
      exclusiveBanner: true,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "3",
      name: "Margarita Indi Pizza",
      category: "Pizza",
      price: 89,
      gst: 10.0,
      rating: 4,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "4",
      name: "Golden Corn Pizza",
      category: "Pizza",
      price: 109,
      gst: 10.0,
      rating: 3,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "5",
      name: "Capsicum Onion Tomato Pizza",
      category: "Pizza",
      price: 109,
      gst: 10.0,
      rating: 3,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "6",
      name: "Corn Cheese",
      category: "Pizza",
      price: 109,
      gst: 10.0,
      rating: 2,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),

  // Burger
  FoodMenuModelItem(
      id: "7",
      name: "Veg Burger",
      category: "Burger",
      price: 59,
      gst: 10.0,
      rating: 4,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "8",
      name: "Chilly Panner Burger",
      category: "Burger",
      price: 89,
      gst: 10.0,
      rating: 3,
      discount: false,
      discountPrice: 0.0,
      banner: true,
      exclusiveBanner: false,
      mustTryBanner: true,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "9",
      name: "Panner Tikka Burger",
      category: "Burger",
      price: 99,
      gst: 10.0,
      rating: 3,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "10",
      name: "Kebab Burger",
      category: "Burger",
      price: 89,
      gst: 10.0,
      rating: 2,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "11",
      name: "Dhaba Makhni Burger",
      category: "Burger",
      price: 99,
      gst: 10.0,
      rating: 2,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0),
  FoodMenuModelItem(
      id: "12",
      name: "Achari Burger",
      category: "Burger",
      price: 79,
      gst: 10.0,
      rating: 2,
      discount: false,
      discountPrice: 0.0,
      banner: false,
      exclusiveBanner: false,
      mustTryBanner: false,
      newBanner: false,
      foodType: 'VEG',
      orderCount: 0)
];
