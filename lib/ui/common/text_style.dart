import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle =
      const TextStyle(fontFamily: 'Poppins', letterSpacing: 0.25);

  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 14.0,
      fontWeight: FontWeight.w400);

  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );

  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 18.0,
      letterSpacing: 0.75,
      fontWeight: FontWeight.w600);

  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w400);

  // home menu style
  static final homeContentTextStyle = baseTextStyle.copyWith(
      color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w400);

  // food detail page header style
  static final detailPageHeaderTextStyle = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 15.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);

  // food detail page header style
  static final detailPageHeaderTextStyle1 = baseTextStyle.copyWith(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);

  // menu list style
  static final menuListItemTitleTextStyle = baseTextStyle.copyWith(
      color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w500);

  // menu list style
  static final menuListItemCurrencyTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);

  // add button
  static final cartAddTextStyle = baseTextStyle.copyWith(
      color: Colors.green, fontSize: 15.0, fontWeight: FontWeight.w500);

  // home menu style
//  static final homeContentTextStyle = baseTextStyle.copyWith(
//      color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w400);

}
