import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/main.dart';

void main() {
  group('Détection des combinaisons', () {
    group('Quinte Flush', () {
      test('Si quinte flush', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.coeur, Rang.valet),
          Carte(Couleur.coeur, Rang.dame),
          Carte(Couleur.coeur, Rang.roi),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.quinteFlush(), isTrue);
      });

      test('Pas une quinte flush', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.deux),
          Carte(Couleur.coeur, Rang.quatre),
          Carte(Couleur.coeur, Rang.six),
          Carte(Couleur.coeur, Rang.huit),
          Carte(Couleur.coeur, Rang.dix),
        ]);

        expect(main.quinteFlush(), isFalse);
      });

      test('Main avec des couleurs différentes', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.coeur, Rang.valet),
          Carte(Couleur.coeur, Rang.dame),
          Carte(Couleur.coeur, Rang.roi),
          Carte(Couleur.pique, Rang.as),
        ]);

        expect(main.quinteFlush(), isFalse);
      });
    });

    group('Quinte Flush Royale', () {
      test('Si quinte flush royale', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.coeur, Rang.valet),
          Carte(Couleur.coeur, Rang.dame),
          Carte(Couleur.coeur, Rang.roi),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.quinteFlushRoyale(), isTrue);
      });

      test('Quinte flush pas royale', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.neuf),
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.coeur, Rang.valet),
          Carte(Couleur.coeur, Rang.dame),
          Carte(Couleur.coeur, Rang.roi),
        ]);

        expect(main.quinteFlushRoyale(), isFalse);
      });

      test('Main avec des couleurs différentes', () {
        final main = MainPoker([
          Carte(Couleur.trefle, Rang.dix),
          Carte(Couleur.coeur, Rang.valet),
          Carte(Couleur.coeur, Rang.dame),
          Carte(Couleur.coeur, Rang.roi),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.quinteFlushRoyale(), isFalse);
      });
    });
  });
  group('Carré', () {
    test('Si carré', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.dix),
        Carte(Couleur.coeur, Rang.as),
      ]);

      expect(main.carre(), isTrue);
    });

    test('Pas un carré (trois cartes identiques seulement)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.neuf),
        Carte(Couleur.coeur, Rang.as),
      ]);

      expect(main.carre(), isFalse);
    });

    test('Pas un carré (toutes les cartes différentes', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.deux),
        Carte(Couleur.carreau, Rang.quatre),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.pique, Rang.huit),
        Carte(Couleur.coeur, Rang.dix),
      ]);

      expect(main.carre(), isFalse);
    });
  });
  group('Full', () {
    test('Si full', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.deux),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      expect(main.full(), isTrue);
    });

    test('Pas un full (juste un brelan)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.neuf),
        Carte(Couleur.coeur, Rang.as),
      ]);

      expect(main.full(), isFalse);
    });

    test('Pas un full (toutes les cartes différentes)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.deux),
        Carte(Couleur.carreau, Rang.quatre),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.pique, Rang.huit),
        Carte(Couleur.coeur, Rang.dix),
      ]);

      expect(main.full(), isFalse);
    });
  });

  group('Couleur/flush', () {
    test('Si couleur', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.trois),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.trefle, Rang.cinq),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.trefle, Rang.roi),
      ]);

      expect(main.flush(), isTrue);
    });

    test('Pas une couleur/flush (quinte flush)', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.trefle, Rang.sept),
        Carte(Couleur.trefle, Rang.six),
      ]);

      expect(main.flush(), isFalse);
    });

    test('Pas une couleur/flush (toutes les cartes différentes)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.deux),
        Carte(Couleur.carreau, Rang.quatre),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.pique, Rang.huit),
        Carte(Couleur.coeur, Rang.dix),
      ]);

      expect(main.flush(), isFalse);
    });
  });
  group('Quinte', () {
    test('Si Quinte (simple)', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.deux),
        Carte(Couleur.carreau, Rang.trois),
        Carte(Couleur.coeur, Rang.quatre),
        Carte(Couleur.pique, Rang.cinq),
        Carte(Couleur.trefle, Rang.six),
      ]);

      expect(main.quinte(), isTrue);
    });
    test('Si Quinte (basse)', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.as),
        Carte(Couleur.carreau, Rang.deux),
        Carte(Couleur.coeur, Rang.trois),
        Carte(Couleur.pique, Rang.quatre),
        Carte(Couleur.trefle, Rang.cinq),
      ]);

      expect(main.quinte(), isTrue);
    });
    test('Si Quinte (haute)', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.carreau, Rang.valet),
        Carte(Couleur.coeur, Rang.dame),
        Carte(Couleur.pique, Rang.roi),
        Carte(Couleur.trefle, Rang.as),
      ]);

      expect(main.quinte(), isTrue);
    });
    test('Pas quinte (quinte flush)', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.trefle, Rang.sept),
        Carte(Couleur.trefle, Rang.six),
      ]);

      expect(main.quinte(), isFalse);
    });

    test('Pas quinte (toutes les cartes différentes)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.deux),
        Carte(Couleur.carreau, Rang.quatre),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.pique, Rang.huit),
        Carte(Couleur.coeur, Rang.dix),
      ]);

      expect(main.quinte(), isFalse);
    });
  });

  group('Brelan', () {
    test('Si brelan', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.carreau, Rang.huit),
        Carte(Couleur.coeur, Rang.huit),
        Carte(Couleur.trefle, Rang.quatre),
        Carte(Couleur.pique, Rang.as),
      ]);

      expect(main.brelan(), isTrue);
    });

    test('Pas brelan (carré)', () {
      final main = MainPoker([
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.trefle, Rang.as),
      ]);

      expect(main.brelan(), isFalse);
    });

    test('Pas une brelan (deux paires)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.deux),
        Carte(Couleur.carreau, Rang.deux),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.coeur, Rang.dix),
      ]);

      expect(main.brelan(), isFalse);
    });
    test('Pas une brelan (toutes les cartes différentes)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.deux),
        Carte(Couleur.carreau, Rang.quatre),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.pique, Rang.huit),
        Carte(Couleur.coeur, Rang.dix),
      ]);

      expect(main.brelan(), isFalse);
    });
  });
}
