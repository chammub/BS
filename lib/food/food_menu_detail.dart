import 'dart:async';

import 'package:bhavani_shoppe/common/cart_home.dart';
import 'package:bhavani_shoppe/common/text_style.dart';
import 'package:bhavani_shoppe/model/foodMenu.dart';
import 'package:bhavani_shoppe/model/foodMenuItem.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailPage extends StatefulWidget {
  static _DetailPageState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<_DetailPageState>());

  final FoodMenu foodMenu;
  DetailPage(this.foodMenu, {Key key}) : super(key: key);
  @override
  _DetailPageState createState() => new _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _totalCartCount = 0;
  int _totalPrice = 0;
//  bool globalClearCartValues = false;
//
//  getSharedPreferences() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    globalClearCartValues = prefs.getBool("globalClearCartValues");
//    print("globalClearCartValues called " + globalClearCartValues.toString());
//  }

  void incrementModelOrderCount(String id) {
    setState(() {
      // update model data
      int _itemIndex = foodMenuModelItemList.indexWhere((e) => e.id == id);
      foodMenuModelItemList[_itemIndex].orderCount += 1;
      updateBottomContainer();
    });
  }

  void decrementModelOrderCount(String id) {
    setState(() {
      // update model data
      int _itemIndex = foodMenuModelItemList.indexWhere((e) => e.id == id);
      foodMenuModelItemList[_itemIndex].orderCount -= 1;
      updateBottomContainer();
    });
  }

  void updateBottomContainer() {
    setState(() {
      _totalPrice = 0;
      _totalCartCount = 0;
      var _iterator = foodMenuModelItemList.iterator;
      while (_iterator.moveNext()) {
        if (_iterator.current.orderCount != 0) {
          // total cart items price
          _totalPrice += _iterator.current.orderCount * _iterator.current.price;
          // total cart items count
          _totalCartCount += _iterator.current.orderCount;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print("detail page init called!");
//    getSharedPreferences().then((data) {
//      if (!globalClearCartValues) {
//        print("globalClearCartValues Cart Cleared!");
//        _cartItems = [];
//      }
//      print("globalClearCartValues " + globalClearCartValues.toString());
//    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white, // new Color(0xFF736AB7),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(context),
            _getToolbar(context),
            _getFooterBar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.asset(
        "res/images/" + widget.foodMenu.icon,
        fit: BoxFit.cover,
        height: 100.0,
      ),
      constraints: new BoxConstraints.expand(height: 160.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 80.0),
      height: 80.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            Colors.white
          ], //new Color(0xFF736AB7)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getFoodThumbnail(context) {
    return new Container(
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              new Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                        margin: const EdgeInsets.only(bottom: 2.0, top: 2.0),
                        child: new Row(children: <Widget>[
                          new Container(
                              margin: const EdgeInsets.only(right: 7.5),
                              child: new Icon(Icons.access_time,
                                  size: 20.0, color: Colors.white)),
                          new Text(widget.foodMenu.duration,
                              style: Style.detailPageHeaderTextStyle)
                        ])),
                    new Text('Delivery Time',
                        style: Style.baseTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w400))
                  ]),
              new Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                        width: 100.0,
                        margin: const EdgeInsets.only(top: 50.0, right: 15.0),
                        child: new Column(children: <Widget>[
                          new Text(widget.foodMenu.name.toUpperCase(),
                              style: Style.detailPageHeaderTextStyle1)
                        ]))
                  ]),
              new Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Container(
                        margin: const EdgeInsets.only(bottom: 2.0),
                        child: new Row(children: <Widget>[
                          new Container(
                              margin: const EdgeInsets.only(right: 7.5),
                              child: new Icon(Icons.restaurant_menu,
                                  size: 20.0, color: Colors.white)),
                          new Text('Rs. ' + widget.foodMenu.minOrder,
                              style: Style.detailPageHeaderTextStyle)
                        ])),
                    new Text('Min Order',
                        style: Style.baseTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 12.5,
                            fontWeight: FontWeight.w400))
                  ])
            ]),
        height: 100.0,
        margin: new EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
        decoration: new BoxDecoration(
            color: new Color(0xFF333366),
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0))
            ]));
  }

  Container _getFoodCardDetails() {
    return new Container(
        alignment: Alignment.topCenter,
        child: new Hero(
            tag: "food-menu-hero-${widget.foodMenu.id}",
            child: new Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      image:
                          new AssetImage("res/images/" + widget.foodMenu.icon),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(100.0)),
                    border:
                        new Border.all(color: Colors.white24, width: 4.0)))));
  }

  Container _getHeader(context) {
    return new Container(
        child: new Stack(children: <Widget>[
      // food thumbnail
      _getFoodThumbnail(context),
      // food card details
      _getFoodCardDetails()
    ]));
  }

  Container _getContent(context) {
    int sDynamicCartHeight = _totalCartCount == 0 ? 175 : 225;
    return new Container(
        child: new ListView(
            padding: new EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 32.0),
            children: <Widget>[
          _getHeader(context),
          new Container(
              height: MediaQuery.of(context).size.height - sDynamicCartHeight,
              child: new CustomScrollView(
                  shrinkWrap: true,
                  physics: new AlwaysScrollableScrollPhysics(),
                  slivers: <Widget>[
                    new SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7.5, horizontal: 5.0),
                        sliver: new SliverList(
                            delegate: new SliverChildBuilderDelegate(
                                (context, index) =>
                                    foodMenuModelItemList[index].category ==
                                            widget.foodMenu.name
                                        ? new FoodMenuItemBuilder(
                                            foodMenuModelItemList[index])
                                        : new Container(),
                                childCount: foodMenuModelItemList.length)))
                  ]))
        ]));
  }

  Container _getToolbar(BuildContext context) {
    _saveValues() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt("totalCartItemsCount", _totalCartCount);
      print("totalCartItemsCount " + _totalCartCount.toString());
    }

    return new Container(
        margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: new IconButton(
            icon: new Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              // save cart items locally
              _saveValues();
              // navigate back to food menu list
              Navigator.of(context).pop();
            }));
  }

  Container _getFooterBar(BuildContext context) {
    return new Container(
        child: _totalCartCount != 0
            ? new Container(
                margin: new EdgeInsets.only(
                    top: MediaQuery.of(context).size.height - 50.0),
                height: 50.0,
                color: Colors.green,
                width: MediaQuery.of(context).size.width,
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      new Container(
                          margin: const EdgeInsets.only(left: 20.0),
                          child: new Row(children: <Widget>[
                            new Text(_totalCartCount.toString(),
                                style: Style.baseTextStyle.copyWith(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    color: Colors.white)),
                            new Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 5.0),
                                child: new Text('ITEMS |',
                                    style: Style.baseTextStyle.copyWith(
                                        fontSize: 18.0, color: Colors.white))),
                            new Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 5.0),
                                child: new Text('₹',
                                    style: const TextStyle(
                                        fontSize: 18.0, color: Colors.white))),
                            new Text(_totalPrice.toString(),
                                style: Style.baseTextStyle.copyWith(
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                    color: Colors.white)),
                          ])),
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
                                              opacity: animation, child: child),
                                    ));
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
                    ]))
            : new Container());
  }
}

class FoodMenuItemBuilder extends StatefulWidget {
  final FoodMenuModelItem foodMenuModelItem;
  FoodMenuItemBuilder(this.foodMenuModelItem, {Key key}) : super(key: key);
  @override
  _FoodMenuItemBuilderState createState() => new _FoodMenuItemBuilderState();
}

class _FoodMenuItemBuilderState extends State<FoodMenuItemBuilder> {
  bool _addBtnVisible = true;

  @override
  void initState() {
    super.initState();
    // load cart details if exist
    if (widget.foodMenuModelItem.orderCount != 0) {
      _addBtnVisible = false;
    }
    _delayTriggerBottomContainer();
  }

  // initialize delay
  Future<Null> delay(int milliseconds) {
    return new Future.delayed(new Duration(milliseconds: milliseconds));
  }

  // delay 500 milliseconds to trigger bottom container
  _delayTriggerBottomContainer() async {
    await delay(100);
    DetailPage.of(context).updateBottomContainer();
  }

  void _cartItemIncrement() {
    DetailPage
        .of(context)
        .incrementModelOrderCount(widget.foodMenuModelItem.id);
  }

  void _cartItemDecrement() {
    DetailPage
        .of(context)
        .decrementModelOrderCount(widget.foodMenuModelItem.id);
    if (widget.foodMenuModelItem.orderCount == 0) {
      setState(() {
        _addBtnVisible = true;
      });
    }
  }

  void _showBottomContainer() {
    setState(() {
      _addBtnVisible = false;
      DetailPage
          .of(context)
          .incrementModelOrderCount(widget.foodMenuModelItem.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodItemCardContent = new Container(
        height: 55.0,
        child: new Row(children: <Widget>[
          // icon
          new Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(left: 10.0, top: 7.0, right: 7.5),
              child: new Image.asset(
                  widget.foodMenuModelItem.foodType == 'VEG'
                      ? 'res/images/ic_veg_icon.png'
                      : 'res/images/ic_non_veg_icon.png',
                  height: 15.0)),

          // name & price
          new Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 1.0, left: 5.0, bottom: 5.0),
              width: 250.0,
              child: new Column(children: <Widget>[
                new Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(widget.foodMenuModelItem.name,
                        style: Style.menuListItemTitleTextStyle)),
                new Container(
                    alignment: Alignment.centerLeft,
                    child: new Row(children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(right: 2.0),
                        child: new Text('₹ ',
                            style: const TextStyle(fontSize: 16.0)),
                      ),
                      new Text(widget.foodMenuModelItem.price.toString(),
                          style: Style.menuListItemCurrencyTextStyle)
                    ]))
              ])),

          // add button & cart items
          _addBtnVisible
              ? new Container(
                  alignment: Alignment.center,
                  child: new OutlineButton(
                      child: new Text('ADD', style: Style.cartAddTextStyle),
                      color: Colors.white,
                      borderSide:
                          new BorderSide(color: Colors.green, width: 4.0),
                      onPressed: _showBottomContainer))
              : new Container(
                  alignment: Alignment.center,
                  child: new Row(children: <Widget>[
                    new Container(
                        width: 30.0,
                        height: 30.0,
                        //alignment: Alignment.center,
                        child: new IconButton(
                            icon: new Icon(Icons.remove, color: Colors.red),
                            alignment: Alignment.topLeft,
                            iconSize: 20.0,
                            padding: const EdgeInsets.only(
                                bottom: 1.0, top: 3.0, left: 3.0),
                            onPressed: _cartItemDecrement),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(100.0)),
                            border: new Border.all(
                                color: Colors.green, width: 2.0))),
                    new Container(
                        width: 22.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: new Text(
                            widget.foodMenuModelItem.orderCount.toString(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: Style.baseTextStyle.copyWith(
                                fontSize: 17.5, fontWeight: FontWeight.bold))),
                    new Container(
                        width: 30.0,
                        height: 30.0,
                        alignment: Alignment.center,
                        child: new IconButton(
                            icon: new Icon(Icons.add, color: Colors.red),
                            alignment: Alignment.topLeft,
                            iconSize: 20.0,
                            padding: const EdgeInsets.only(
                                bottom: 1.0, top: 3.0, left: 3.0),
                            onPressed: _cartItemIncrement),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(100.0)),
                            border: new Border.all(
                                color: Colors.green, width: 2.0)))
                  ]))
        ]));

    final foodMenuItemCardBanner = new Container(
        margin: const EdgeInsets.only(left: 40.0),
        alignment: Alignment.centerLeft,
        child: new Row(
          children: <Widget>[
            // exclusive banner
            widget.foodMenuModelItem.exclusiveBanner
                ? new Image.asset(
                    'res/images/ic_banner_bhavani_exclusive.png',
                    height: 27.5,
                  )
                : new Container(),
            // must try banner
            widget.foodMenuModelItem.mustTryBanner
                ? new Image.asset(
                    'res/images/ic_banner_must_try.png',
                    height: 27.5,
                  )
                : new Container(),
            // new banner
            widget.foodMenuModelItem.newBanner
                ? new Image.asset(
                    'res/images/ic_banner_new.png',
                    height: 27.5,
                  )
                : new Container(),
          ],
        ));

    final foodMenuItemCard = new Column(
      children: <Widget>[
        // banner
        widget.foodMenuModelItem.banner
            ? foodMenuItemCardBanner
            : new Container(),
        // card
        foodItemCardContent
      ],
    );

    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 0.75, horizontal: 5.0),
        child: new Stack(children: <Widget>[foodMenuItemCard]));
  }
}
