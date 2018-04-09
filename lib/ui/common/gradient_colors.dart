import 'package:flutter/material.dart';
// import 'package:bhavani_shoppe/ui/common/hex_colors.dart';

class GradientColors {
  static final blueGradient = const LinearGradient(
      colors: const <Color>[const Color(0xFF0075D1), const Color(0xFF00A2E3)],
      stops: const <double>[0.4, 0.6],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft);

  static final purpleGradient = const LinearGradient(
      colors: const <Color>[const Color(0xFF882DEB), const Color(0xFF9A4DFF)],
      stops: const <double>[0.5, 0.7],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static final redGradient = const LinearGradient(
      colors: const <Color>[const Color(0xFFBA110E), const Color(0xFFCF3110)],
      stops: const <double>[0.6, 0.8],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft);

  static final orangeGradient = const LinearGradient(
      colors: const <Color>[const Color(0xFFFAD961), const Color(0xFFF76B1C)],
      stops: const <double>[0.1, 0.7],
      begin: Alignment.topRight,
      end: Alignment.bottomCenter);

  static final blueGradientTitle = const LinearGradient(
      colors: const <Color>[const Color(0xFF3366FF), const Color(0xFF00CCFF)],
      stops: const <double>[0.0, 1.0],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      tileMode: TileMode.clamp);

  static final homeScreenGradient = const LinearGradient(
      // colors: const <Color>[const Color(0xFFf6d365), const Color(0xFFda085)],
      colors: const <Color>[const Color(0xFFf6d365), const Color(0xFFda085)],
      stops: const <double>[0.0, 1.0],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft);
}
