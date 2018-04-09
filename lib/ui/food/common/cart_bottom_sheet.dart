import 'dart:convert';

import 'package:bhavani_shoppe/ui/common/text_style.dart';
import 'package:flutter/material.dart';

//class BuildCartBottomSheet extends StatefulWidget {
//  @override
//  _BuildCartBottomSheetState createState() => new _BuildCartBottomSheetState();
//}
//
//class _BuildCartBottomSheetState extends State<BuildCartBottomSheet> {
//  @override
//  Widget build(BuildContext context) {
//    return new Container( child: new Text('Hello', style: Style.baseTextStyle),);
//  }
//}

Widget buildCartBottomSheet(BuildContext context, String result) {
  // read count and price from data
  // decode result
  final Map decodeResult = json.decode(result.toString());
  String count = decodeResult['count'];
  String price = decodeResult['price'];

  print(count);

  return new Container(
    height: 50.0,
    color: Colors.green,
    width: MediaQuery.of(context).size.width,
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        new Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: new Text(count + ' Item | Rs. ' + price,
                textAlign: TextAlign.start,
                style: Style.baseTextStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                    color: Colors.white))),
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
                          padding: const EdgeInsets.only(right: 10.0),
                          child: new Text('VIEW CART',
                              style: Style.baseTextStyle.copyWith(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                      new Icon(Icons.shopping_cart,
                          size: 25.0, color: Colors.white)
                    ])))
      ],
    ),
  );
}
