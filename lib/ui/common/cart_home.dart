import 'package:bhavani_shoppe/model/foodMenuItem.dart';
import 'package:bhavani_shoppe/ui/common/text_style.dart';
import 'package:flutter/material.dart';

class CartHome extends StatefulWidget {
  static _CartHomeState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<_CartHomeState>());
  @override
  _CartHomeState createState() => new _CartHomeState();
}

class _CartHomeState extends State<CartHome> {
  int _totalPrice = 0;
  double _discount = 0.0;
  double _deliveryCharge = 0.0;
  double _grandTotal = 0.0;

  String _totalPriceTxt;
  String _discountTxt;
  String _deliveryChargeTxt;
  String _grandTotalTxt;

  TextStyle _billHeaderTextStyle =
      Style.baseTextStyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w500);
  TextStyle _billItemTextStyle =
      Style.baseTextStyle.copyWith(fontSize: 15.0, fontWeight: FontWeight.w400);

  void updateBill() {
    _totalPrice = 0;
    var _iterator = foodMenuModelItemList.iterator;
    while (_iterator.moveNext()) {
      if (_iterator.current.orderCount != 0) {
        // total cart items price
        _totalPrice += _iterator.current.orderCount * _iterator.current.price;
      }
    }
    if (_totalPrice >= 500) {
      _deliveryCharge = 0.0;
    } else {
      _deliveryCharge = 50.0;
    }
    _grandTotal = _totalPrice - _discount + _deliveryCharge;
    _totalPriceTxt = _totalPrice.toStringAsFixed(2);
    _discountTxt = _discount.toStringAsFixed(2);
    _deliveryChargeTxt = _deliveryCharge.toStringAsFixed(2);
    _grandTotalTxt = _grandTotal.toStringAsFixed(2);
  }

  void incrementCart(String id) {
    setState(() {
      // update model data
      int _itemIndex = foodMenuModelItemList.indexWhere((e) => e.id == id);
      foodMenuModelItemList[_itemIndex].orderCount += 1;
      updateBill();
    });
  }

  void decrementCart(String id) {
    setState(() {
      // update model data
      int _itemIndex = foodMenuModelItemList.indexWhere((e) => e.id == id);
      foodMenuModelItemList[_itemIndex].orderCount -= 1;
      updateBill();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateBill();
  }

  @override
  Widget build(BuildContext context) {
    double halfWidth = MediaQuery.of(context).size.width / 2.0;

    Container pageHeader = new Container(
      padding: const EdgeInsets.only(bottom: 7.5),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.grey[300]))),
      height: 75.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: new Image.asset(
                'res/images/ic_logo.png',
                height: 35.0,
                width: 35.0,
                fit: BoxFit.contain,
              )),
          new Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 7.5),
              child: new Text("CART ITEMS", style: _billHeaderTextStyle))
        ],
      ),
    );

    Container horizontalSplitter = new Container(
        margin: new EdgeInsets.symmetric(vertical: 5.0),
        height: 0.5,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey[300]);

    Container restaurantBill = new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
            child: new Text("Restaurant Bill", style: _billHeaderTextStyle),
          ),
          new Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text("Item Total", style: _billItemTextStyle),
                    new Row(children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Text('₹',
                              style: const TextStyle(fontSize: 15.0))),
                      new Text("$_totalPriceTxt", style: _billItemTextStyle)
                    ])
                  ])),
          new Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text("Offer Discount", style: _billItemTextStyle),
                    new Row(children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Text('₹',
                              style: const TextStyle(fontSize: 15.0))),
                      new Text("$_discountTxt", style: _billItemTextStyle)
                    ])
                  ])),
          horizontalSplitter,
          new Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text("Delivery Charges", style: _billItemTextStyle),
                    new Row(children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Text('₹',
                              style: const TextStyle(fontSize: 15.0))),
                      new Text("$_deliveryChargeTxt", style: _billItemTextStyle)
                    ])
                  ])),
          horizontalSplitter,
          new Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text("To Pay", style: _billHeaderTextStyle),
                    new Row(children: <Widget>[
                      new Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: new Text('₹',
                              style: const TextStyle(fontSize: 15.0))),
                      new Text("$_grandTotalTxt", style: _billHeaderTextStyle)
                    ])
                  ]))
        ],
      ),
    );

    Expanded cartHomePageBody = new Expanded(
        child: new Container(
      //color: new Color(0xFF736AB7),
      child: new CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5.0),
            sliver: new SliverList(
              delegate: new SliverChildBuilderDelegate(
                (context, index) => foodMenuModelItemList[index].orderCount != 0
                    ? new CartHomeBuilder(foodMenuModelItemList[index])
                    : new Container(),
                //new CartHomeBuilder(widget.cartItems[index]),
                childCount: foodMenuModelItemList.length,
              ),
            ),
          ),
        ],
      ),
    ));

    Container bookingButton = new Container(
      height: 50.0,
      width: halfWidth,
      decoration: BoxDecoration(color: Colors.green),
      // border: Border.all(width: 0.5, color: Colors.white)),
      child: new GestureDetector(
          onTap: () {},
          child: new Center(
              child: new Text("CONFIRM ORDER",
                  style: Style.baseTextStyle.copyWith(
                      fontSize: 15.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)))),
    );

    Container userDetails = new Container(
        height: 50.0,
        width: halfWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.5, color: Colors.grey[300])),
        child: new GestureDetector(
            onTap: () {},
            child: new Center(
                child: new Text("ADDRESS",
                    style: Style.baseTextStyle.copyWith(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)))));

    Container footer = new Container(
      height: 40.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[userDetails, bookingButton],
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Column(
        children: <Widget>[
          pageHeader,
          // new GradientAppBar("Bhavani Food"),
          cartHomePageBody,
          restaurantBill,
          new Container(
            height: 50.0,
          ),
          footer
        ],
      ),
    );
  }
}

class CartHomeBuilder extends StatefulWidget {
  final FoodMenuModelItem foodMenuModelItem;
  CartHomeBuilder(this.foodMenuModelItem, {Key key}) : super(key: key);
  @override
  _CartHomeBuilderState createState() => new _CartHomeBuilderState();
}

class _CartHomeBuilderState extends State<CartHomeBuilder> {
  int _itemPrice = 0;
  String _itemPriceTxt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateItemPrice();
  }

  void updateItemPrice() {
    _itemPrice =
        widget.foodMenuModelItem.orderCount * widget.foodMenuModelItem.price;
    _itemPriceTxt = _itemPrice.toString();
  }

  void _cartItemIncrement() {
    CartHome.of(context).incrementCart(widget.foodMenuModelItem.id);
    setState(() {
      updateItemPrice();
    });
  }

  void _cartItemDecrement() {
    CartHome.of(context).decrementCart(widget.foodMenuModelItem.id);
    setState(() {
      updateItemPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodMenuItemCards = new Container(
        height: 45.0,
        child: new Row(children: <Widget>[
          // icon
          new Container(
              margin: const EdgeInsets.only(left: 5.0, right: 7.5),
              child: new Center(
                  child: new Image.asset(
                      widget.foodMenuModelItem.foodType == 'VEG'
                          ? 'res/images/ic_veg_icon.png'
                          : 'res/images/ic_non_veg_icon.png',
                      height: 15.0))),

          // name & price
          new Container(
              margin: const EdgeInsets.only(left: 5.0),
              width: MediaQuery.of(context).size.width - 180.0,
              child: new Center(
                  child: new Container(
                      alignment: Alignment.centerLeft,
                      child: new Text(widget.foodMenuModelItem.name,
                          overflow: TextOverflow.ellipsis,
                          style: Style.menuListItemTitleTextStyle)))),

          // cart items add or remove
          new Container(
              alignment: Alignment.center,
              child: new Row(children: <Widget>[
                new Container(
                    width: 25.0,
                    height: 25.0,
                    child: new IconButton(
                        icon: new Icon(Icons.remove, color: Colors.red),
                        alignment: Alignment.topLeft,
                        iconSize: 15.0,
                        padding: const EdgeInsets.only(
                            bottom: 1.0, top: 3.0, left: 3.0),
                        onPressed: _cartItemDecrement),
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(100.0)),
                        border:
                            new Border.all(color: Colors.green, width: 2.0))),
                new Container(
                    width: 20.0,
                    margin: const EdgeInsets.symmetric(horizontal: 2.5),
                    child: new Text(
                        widget.foodMenuModelItem.orderCount.toString(),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: Style.baseTextStyle.copyWith(
                            fontSize: 12.5, fontWeight: FontWeight.w500))),
                new Container(
                    width: 25.0,
                    height: 25.0,
                    alignment: Alignment.center,
                    child: new IconButton(
                        icon: new Icon(Icons.add, color: Colors.red),
                        alignment: Alignment.topLeft,
                        iconSize: 15.0,
                        padding: const EdgeInsets.only(
                            bottom: 1.0, top: 3.0, left: 3.0),
                        onPressed: _cartItemIncrement),
                    decoration: new BoxDecoration(
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(100.0)),
                        border:
                            new Border.all(color: Colors.green, width: 2.0)))
              ])),

          // price
          new Container(
              width: 50.0,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        margin: const EdgeInsets.only(right: 2.5),
                        child: new Text('₹',
                            style: const TextStyle(fontSize: 15.0))),
                    new Text("$_itemPriceTxt",
                        overflow: TextOverflow.ellipsis,
                        style: Style.baseTextStyle.copyWith(fontSize: 15.0))
                  ]))
        ]));

    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 0.75, horizontal: 5.0),
      child: new Stack(
        children: <Widget>[foodMenuItemCards],
      ),
    );
  }
}
