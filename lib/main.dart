import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

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

class Carte {
  final String couleur;
  final int rang;

  Carte(this.couleur, this.rang);

  @override
  String toString() {
    return 'Carte(rang: $rang, couleur: $couleur)';
  }
}

class MainPoker {
  final List<Carte> cartes;

  MainPoker(this.cartes) {
    if (cartes.length != 5) {
      throw ArgumentError('Il faut exactement 5 cartes');
    }
  }

  bool quinteFlushRoyale() {
    final couleurUnique = cartes.first.couleur;
    if (cartes.any((carte) => carte.couleur != couleurUnique)) {
      return false;
    }

    final rangsTries = cartes.map((c) => c.rang).toList()..sort();

    const royaleFlushRangs = [10, 11, 12, 13, 14];
    return ListEquality().equals(rangsTries, royaleFlushRangs);
  }

  bool quinteFlush() {
    final couleurUnique = cartes.first.couleur;
    if (cartes.any((carte) => carte.couleur != couleurUnique)) {
      return false;
    }

    final rangsTries = cartes.map((c) => c.rang).toList()..sort();

    for (int i = 0; i < rangsTries.length - 1; i++) {
      if (rangsTries[i] + 1 != rangsTries[i + 1]) {
        return false;
      }
    }

    return true;
  }

  bool carre() {
    final Map<int, int> compteRangs = {};

    for (var carte in cartes) {
      compteRangs[carte.rang] = (compteRangs[carte.rang] ?? 0) + 1;
    }

    return compteRangs.values.contains(4);
  }

  bool full() {
    final Map<int, int> compteRangs = {};

    for (var carte in cartes) {
      compteRangs[carte.rang] = (compteRangs[carte.rang] ?? 0) + 1;
    }
    return compteRangs.values.contains(3) && compteRangs.values.contains(2);
  }

  bool flush() {
    final couleurUnique = cartes.first.couleur;
    if (cartes.any((carte) => carte.couleur != couleurUnique)) {
      return false;
    }

    final rangsTries = cartes.map((c) => c.rang).toList()..sort();

    bool quinte = true;
    for (int i = 0; i < rangsTries.length - 1; i++) {
      if (rangsTries[i] + 1 != rangsTries[i + 1]) {
        quinte = false;
        break;
      }
    }
    return !quinte;
  }

  bool quinte() {
    final rangsTries = cartes.map((c) => c.rang).toList()..sort();

    // quinte basse
    if (rangsTries.contains(Rang.as) &&
        rangsTries.contains(Rang.deux) &&
        rangsTries.contains(Rang.trois) &&
        rangsTries.contains(Rang.quatre) &&
        rangsTries.contains(Rang.cinq)) {
      return true;
    }

    for (int i = 0; i < rangsTries.length - 1; i++) {
      if (rangsTries[i] + 1 != rangsTries[i + 1]) {
        return false;
      }
    }

    final couleurUnique = cartes.first.couleur;
    bool quinteFlush = cartes.every((c) => c.couleur == couleurUnique);

    return !quinteFlush;
  }

  bool brelan() {
    final Map<int, int> compteRangs = {};

    for (var carte in cartes) {
      compteRangs[carte.rang] = (compteRangs[carte.rang] ?? 0) + 1;
    }

    return compteRangs.values.contains(3) && !compteRangs.values.contains(2);
  }
}
