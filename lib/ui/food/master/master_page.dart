import 'dart:async';

import 'package:bhavani_shoppe/model/foodMenu.dart';
import 'package:bhavani_shoppe/model/foodMenuItem.dart';
import 'package:bhavani_shoppe/ui/common/gradient_app_bar.dart';
import 'package:bhavani_shoppe/ui/food/master/master_page_item_builder.dart';
import 'package:flutter/material.dart';

class FoodHomePage extends StatelessWidget {
  // The AppBar's action needs this key to find its own Scaffold.
  final GlobalKey<ScaffoldState> _scaffoldFoodHomeKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: _requestPop,
        child: new Scaffold(
            key: _scaffoldFoodHomeKey,
            body: new Column(children: <Widget>[
              new GradientAppBar("Bhavani Food"),
              new HomePageBody()
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

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: new Color(0xFF736AB7),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding:
                  const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new FoodMenuItem(foodMenuList[index]),
                  childCount: foodMenuList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
