import 'dart:async';
import 'dart:ui' as ui;

import 'package:bhavani_shoppe/common/cart_home.dart';
import 'package:bhavani_shoppe/common/text_style.dart';
import 'package:bhavani_shoppe/food/food_menu_detail.dart';
import 'package:bhavani_shoppe/model/foodMenu.dart';
import 'package:bhavani_shoppe/model/foodMenuItem.dart';
import 'package:flutter/material.dart';

class FoodHomePage extends StatelessWidget {
  // The AppBar's action needs this key to find its own Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldFoodHomeKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Container pageHeader = new Container(
        padding: const EdgeInsets.only(bottom: 7.5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey[300]))),
        height: 75.0,
        child: new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: new BackButton(color: Colors.black)),
                  new Hero(
                      tag: "logo-hero",
                      child: new Image.asset('res/images/ic_logo.png',
                          height: 35.0, width: 35.0, fit: BoxFit.contain)),
                  new Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 7.5),
                      child: new Text("BHAVANI FOOD",
                          style: Style.foodMenuHeaderTextStyle))
                ])));

    Expanded pageContent = new Expanded(
        child: new Container(
            color: Colors.white,
            child: new CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                slivers: <Widget>[
                  new SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      sliver: new SliverGrid(
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          delegate: new SliverChildBuilderDelegate(
                              (context, index) =>
                                  new FoodMenuBuilder(foodMenuList[index]),
                              childCount: foodMenuList.length)))
                ])));
    return new WillPopScope(
        onWillPop: _requestPop,
        child: new Scaffold(
            key: _scaffoldFoodHomeKey,
            body: new Column(children: <Widget>[
              // new GradientAppBar("Bhavani Food"),
              pageHeader,
              pageContent
            ])));
  }

  Future<bool> _requestPop() {
    // TODO
    print("will pop scope called!");
    var _iterator = foodMenuModelItemList.iterator;
    while (_iterator.moveNext()) {
      // clear cart
      _iterator.current.orderCount = 0;
    }
    return new Future.value(true);
  }
}

class FoodMenuBuilder extends StatefulWidget {
  final FoodMenu foodMenu;
  FoodMenuBuilder(this.foodMenu);
  @override
  _FoodMenuBuilderState createState() => new _FoodMenuBuilderState();
}

class _FoodMenuBuilderState extends State<FoodMenuBuilder> {
  @override
  Widget build(BuildContext context) {
    Hero foodPic = new Hero(
        tag: "food-menu-hero-${widget.foodMenu.id}",
        child: new Container(
            height: 120.0,
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("res/images/" + widget.foodMenu.icon),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(new Radius.circular(2.5)))));

    Container foodInfo = new Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          new Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: new Text(widget.foodMenu.name,
                  style: Style.foodMenuHeaderTextStyle)),
          new Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: new Container(
                  height: 1.0, width: 30.0, color: new Color(0xff00c6ff))),
          new Text(widget.foodMenu.count + ' Items',
              style: Style.foodMenuItemTextStyle)
        ]));

    Container wrapper = new Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent, width: 1.0)),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[foodPic, foodInfo]));

    _navigateAndDisplaySelection(BuildContext context) {
      Navigator.of(context).push(
            new PageRouteBuilder(
                pageBuilder: (context, __, ___) =>
                    new DetailPage(widget.foodMenu),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        new FadeTransition(opacity: animation, child: child)),
          );
      // After the Selection Screen returns a result, show it in a bottom!
      Scaffold.of(context).showBottomSheet((BuildContext bottomSheetContext) {
        var _totalPrice = 0;
        var _totalCartCount = 0;
        var _iterator = foodMenuModelItemList.iterator;
        while (_iterator.moveNext()) {
          if (_iterator.current.orderCount != 0) {
            // total cart items price
            _totalPrice +=
                _iterator.current.orderCount * _iterator.current.price;
            // total cart items count
            _totalCartCount += _iterator.current.orderCount;
          }
        }

        print('count: ' +
            _totalCartCount.toString() +
            ' price: ' +
            _totalPrice.toString());

        if (_totalCartCount == 0) {
          return null;
        } else {
          return new Container(
              height: 50.0,
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Container(
                      margin: const EdgeInsets.only(left: 20.0),
                      child: new Row(
                        children: <Widget>[
                          new Text(_totalCartCount.toString(),
                              style: Style.baseTextStyle.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  color: Colors.white)),
                          new Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              child: new Text('ITEMS |',
                                  style: Style.baseTextStyle.copyWith(
                                      fontSize: 18.0, color: Colors.white))),
                          new Container(
                              margin: new EdgeInsets.symmetric(horizontal: 5.0),
                              child: new Text('₹',
                                  style: const TextStyle(
                                      fontSize: 18.0, color: Colors.white))),
                          new Text(_totalPrice.toString(),
                              style: Style.baseTextStyle.copyWith(
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                    new Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        child: new GestureDetector(
                            onTap: () {
                              // navigate to cart
                              Navigator.of(context).push(new PageRouteBuilder(
                                  pageBuilder: (context, __, ___) =>
                                      new CartHome(),
                                  transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) =>
                                      new FadeTransition(
                                          opacity: animation, child: child)));
                            },
                            child: new Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  new Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: new Text('VIEW CART',
                                          style: Style.baseTextStyle.copyWith(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white))),
                                  new Icon(Icons.shopping_cart,
                                      size: 25.0, color: Colors.white)
                                ])))
                  ]));
        }
      });
    }

    return new GestureDetector(
        onTap: () {
          _navigateAndDisplaySelection(context);
        },
        child: wrapper);
  }
}
