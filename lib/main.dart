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

    /// quinte flush basse
    if (rangsTries.equals([2, 3, 4, 5, 14])) {
      return true;
    }

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

  bool deuxPaires() {
    final Map<int, int> compteRangs = {};

    for (var carte in cartes) {
      compteRangs[carte.rang] = (compteRangs[carte.rang] ?? 0) + 1;
    }

    return compteRangs.values.where((count) => count == 2).length == 2;
  }

  bool paire() {
    final Map<int, int> compteRangs = {};

    for (var carte in cartes) {
      compteRangs[carte.rang] = (compteRangs[carte.rang] ?? 0) + 1;
    }

    return compteRangs.values.where((count) => count == 2).length == 1;
  }

  bool carteHaute() {
    return !quinteFlushRoyale() &&
        !quinteFlush() &&
        !carre() &&
        !full() &&
        !flush() &&
        !quinte() &&
        !brelan() &&
        !deuxPaires() &&
        !paire();
  }

  Carte cartePlusHaute() {
    return cartes.reduce((max, carte) => carte.rang > max.rang ? carte : max);
  }

  int getScore() {
    if (quinteFlushRoyale()) return 10;
    if (quinteFlush()) return 9;
    if (carre()) return 8;
    if (full()) return 7;
    if (flush()) return 6;
    if (quinte()) return 5;
    if (brelan()) return 4;
    if (deuxPaires()) return 3;
    if (paire()) return 2;
    return 1;
  }

  /// 1 si la main actuelle est plus forte
  /// -1 si l'autre main est plus forte
  /// 0 si les deux mains sont égales
  int comparerMain(MainPoker autre) {
    int premierScore = getScore();
    int scoreAdverse = autre.getScore();

    if (premierScore > scoreAdverse) return 1;
    if (premierScore < scoreAdverse) return -1;
    if (premierScore == 7 && scoreAdverse == 7) {
      final monBrelan = getBrelan();
      final brelanAdverse = autre.getBrelan();

      if (monBrelan > brelanAdverse) return 1;
      if (monBrelan < brelanAdverse) return -1;

      final maPaire = getPaire();
      final paireAdverse = autre.getPaire();

      if (maPaire > paireAdverse) return 1;
      if (maPaire < paireAdverse) return -1;
    }

    final mesRangs =
        cartes.map((c) => c.rang).toList()..sort((a, b) => b.compareTo(a));
    final rangsAdverses =
        autre.cartes.map((c) => c.rang).toList()
          ..sort((a, b) => b.compareTo(a));

    for (int i = 0; i < 5; i++) {
      if (mesRangs[i] > rangsAdverses[i]) return 1;
      if (mesRangs[i] < rangsAdverses[i]) return -1;
    }

    return 0;
  }

  int getBrelan() {
    final compteRangs = <int, int>{};

    for (var carte in cartes) {
      compteRangs[carte.rang] = (compteRangs[carte.rang] ?? 0) + 1;
    }

    return compteRangs.entries.firstWhere((e) => e.value == 3).key;
  }

  int getPaire() {
    final compteRangs = <int, int>{};

    for (var carte in cartes) {
      compteRangs[carte.rang] = (compteRangs[carte.rang] ?? 0) + 1;
    }

    return compteRangs.entries.firstWhere((e) => e.value == 2).key;
  }
}
