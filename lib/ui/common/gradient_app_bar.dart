import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    int totalCartItemsCount;
    bool cancelPressed;

    getSharedPreferences() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      totalCartItemsCount = prefs.getInt("totalCartItemsCount");
    }

//    _saveValues(bClear) async {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//      prefs.setBool("globalClearCartValues", bClear);
//    }

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Row(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
            child:

//            new IconButton(
//              icon: new Icon(Icons.arrow_back),
//              color: Colors.white,
//              onPressed: () {
//                getSharedPreferences().then((data) {
//                  if (totalCartItemsCount == 0 || totalCartItemsCount == null) {
//                    Navigator.pop(context);
//                  } else {
//                    Future<Null> _neverSatisfied() async {
//                      return showDialog<Null>(
//                        context: context,
//                        barrierDismissible: false, // user must tap button!
//                        child: new AlertDialog(
//                          contentPadding: const EdgeInsets.all(10.0),
//                          title: new Text("CART",
//                              style: Style.baseTextStyle.copyWith(
//                                  fontSize: 17.5,
//                                  letterSpacing: 1.0,
//                                  fontWeight: FontWeight.w500,
//                                  color: Colors.blue)),
//                          content: new Container(
//                            padding:
//                                const EdgeInsets.only(left: 15.0, top: 5.0),
//                            child: new Row(
//                              children: <Widget>[
//                                new Text("CLEAR CART ITEMS",
//                                    style: Style.baseTextStyle.copyWith(
//                                        fontSize: 15.0,
//                                        fontWeight: FontWeight.w400,
//                                        letterSpacing: 1.0,
//                                        color: Colors.black)),
//                                new Padding(
//                                    padding: const EdgeInsets.only(
//                                        left: 5.0, bottom: 2.5),
//                                    child: new Icon(Icons.shopping_cart,
//                                        size: 22.5, color: Colors.green))
//                              ],
//                            ),
//                          ),
//                          actions: <Widget>[
//                            new FlatButton(
//                              child: new Text('OK',
//                                  style: Style.baseTextStyle.copyWith(
//                                      fontSize: 15.0,
//                                      fontWeight: FontWeight.w500,
//                                      letterSpacing: 1.0,
//                                      color: Colors.green)),
//                              onPressed: () {
//                                cancelPressed = false;
//                                Navigator.pop(context);
//                              },
//                            ),
//                            new FlatButton(
//                              child: new Text('CLOSE',
//                                  style: Style.baseTextStyle.copyWith(
//                                      fontSize: 15.0,
//                                      fontWeight: FontWeight.w500,
//                                      letterSpacing: 1.0,
//                                      color: Colors.red)),
//                              onPressed: () {
//                                cancelPressed = true;
//                                Navigator.pop(context);
//                              },
//                            ),
//                          ],
//                        ),
//                      );
//                    }
//
//                    _neverSatisfied().then((data) {
//                      if (!cancelPressed) {
//                        // clear global cart values
//                        // _saveValues(cancelPressed);
//                        // close bottom sheet
//                        Navigator.pop(context);
//                        // navigate to back
//                        Navigator.pop(context);
//                      }
//                    });
//                  }
//                });
//              },
//            ),
                new BackButton(color: Colors.white),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 5.0),
            child: new Hero(
                tag: "logo-hero",
                child: new Center(
                  child: new Image.asset(
                    'res/images/ic_logo.png',
                    height: 55.0,
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                )),
          ),
          new Container(
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            child: new Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 25.0),
            ),
          ),
        ],
      ),
      decoration: new BoxDecoration(
          // gradient: GradientColors.homeScreenGradient,
          color: const Color(0xff7c94b6)),
    );
  }
}
