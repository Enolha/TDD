import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Couleur {
  static const coeur = 'coeur';
  static const carreau = 'carreau';
  static const trefle = 'trefle';
  static const pique = 'pique';

  final String value;
  const Couleur(this.value);
}

class Rang {
  static const deux = 2;
  static const trois = 3;
  static const quatre = 4;
  static const cinq = 5;
  static const six = 6;
  static const sept = 7;
  static const huit = 8;
  static const neuf = 9;
  static const dix = 10;
  static const valet = 11;
  static const dame = 12;
  static const roi = 13;
  static const as = 14;
  final int value;
  const Rang(this.value);
}
