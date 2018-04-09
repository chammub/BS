import 'package:bhavani_shoppe/model/foodMenu.dart';
import 'package:bhavani_shoppe/model/foodMenuItem.dart';
import 'package:bhavani_shoppe/ui/common/text_style.dart';
import 'package:bhavani_shoppe/ui/food/common/separator.dart';
import 'package:bhavani_shoppe/ui/food/detail/detail_page.dart';
import 'package:flutter/material.dart';

class FoodMenuItem extends StatelessWidget {
  final FoodMenu foodMenu;

  FoodMenuItem(this.foodMenu);

  FoodMenuItem.vertical(this.foodMenu);

  @override
  Widget build(BuildContext context) {
    final foodThumbnail = new Container(
      margin: new EdgeInsets.only(left: 15.0, top: 15.0),
      alignment: FractionalOffset.centerLeft,
      child: new Hero(
          tag: "food-menu-hero-${foodMenu.id}",
          child: new Container(
            width: 120.0,
            height: 95.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new AssetImage("res/images/" + foodMenu.icon),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
              border: new Border.all(
                color: Colors.white30,
                width: 4.0,
              ),
            ),
          )),
    );

    Widget _foodValues({String value, String image, Color color}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image.asset(image, height: 17.5, color: color),
          new Container(width: 8.0),
          new Text(value, style: Style.commonTextStyle),
        ]),
      );
    }

    final foodCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(150.0, 12.5, 16.0, 0.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 2.0),
          new Text(foodMenu.name, style: Style.titleTextStyle),
          new Container(height: 2.0),
          new Text(foodMenu.count + ' Items', style: Style.commonTextStyle),
          new Separator(),
          new Container(height: 2.0),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: 1,
                  child: _foodValues(
                      value: foodMenu.foodType,
                      image: foodMenu.foodType == 'VEG'
                          ? 'res/images/ic_veg_icon.png'
                          : 'res/images/ic_non_veg_icon.png',
                      color: null)),
              new Container(
                width: 32.0,
              ),
              new Expanded(
                  flex: 1,
                  child: _foodValues(
                      value: foodMenu.duration,
                      image: 'res/images/ic_food_duration.png',
                      color: Colors.white70))
            ],
          ),
        ],
      ),
    );

    final foodMenuCard = new Container(
      child: foodCardContent,
      height: 124.0,
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    // A method that launches the SelectionScreen and awaits the result from
    // Navigator.pop!
    _navigateAndDisplaySelection(BuildContext context) {
      Navigator.of(context).push(
            new PageRouteBuilder(
              pageBuilder: (context, __, ___) => new DetailPage(foodMenu),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      new FadeTransition(opacity: animation, child: child),
            ),
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
                              child: new Text('ITEMS  |',
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
                              print('Navigation to Cart triggered');
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

    nav(BuildContext context) {
      Navigator.of(context).push(new PageRouteBuilder(
          pageBuilder: (context, __, ___) => new DetailPage(foodMenu),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              new FadeTransition(opacity: animation, child: child)));
    }

    return new GestureDetector(
        onTap: () {
          _navigateAndDisplaySelection(context);
//          nav(context);
        },
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 5.0,
          ),
          child: new Stack(
            children: <Widget>[
              foodMenuCard,
              foodThumbnail,
            ],
          ),
        ));
  }
}
