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

      test('Si quinte flush (basse)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.as),
          Carte(Couleur.coeur, Rang.deux),
          Carte(Couleur.coeur, Rang.trois),
          Carte(Couleur.coeur, Rang.quatre),
          Carte(Couleur.coeur, Rang.cinq),
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
    group('Deux Paires', () {
      test('Si deux paires', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.cinq),
          Carte(Couleur.pique, Rang.cinq),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.deuxPaires(), isTrue);
      });

      test('Pas deux paires (une paire)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.cinq),
          Carte(Couleur.pique, Rang.neuf),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.deuxPaires(), isFalse);
      });

      test('Pas deux paires (Brelan)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.dix),
          Carte(Couleur.pique, Rang.cinq),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.deuxPaires(), isFalse);
      });

      test('Pas deux paires (toutes les cartes différentes)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.deux),
          Carte(Couleur.carreau, Rang.quatre),
          Carte(Couleur.trefle, Rang.six),
          Carte(Couleur.pique, Rang.huit),
          Carte(Couleur.coeur, Rang.dix),
        ]);

        expect(main.deuxPaires(), isFalse);
      });
    });
    group('Paire', () {
      test('Si une paire', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.cinq),
          Carte(Couleur.pique, Rang.neuf),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.paire(), isTrue);
      });

      test('Pas une paire (deux paires)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.cinq),
          Carte(Couleur.pique, Rang.cinq),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.paire(), isFalse);
      });

      test('Pas une paire (Brelan)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.dix),
          Carte(Couleur.pique, Rang.cinq),
          Carte(Couleur.coeur, Rang.as),
        ]);

        expect(main.paire(), isFalse);
      });

      test('Pas une paire (toutes les cartes différentes)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.deux),
          Carte(Couleur.carreau, Rang.quatre),
          Carte(Couleur.trefle, Rang.six),
          Carte(Couleur.pique, Rang.huit),
          Carte(Couleur.coeur, Rang.dix),
        ]);

        expect(main.paire(), isFalse);
      });
    });
    group('Carte Haute', () {
      test('Si carte haute', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.as),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.neuf),
          Carte(Couleur.pique, Rang.sept),
          Carte(Couleur.coeur, Rang.deux),
        ]);

        expect(main.carteHaute(), isTrue);
        expect(main.cartePlusHaute().rang, Rang.as);
      });

      test('Pas une carte haute (Paire)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.dix),
          Carte(Couleur.trefle, Rang.neuf),
          Carte(Couleur.pique, Rang.sept),
          Carte(Couleur.coeur, Rang.deux),
        ]);

        expect(main.carteHaute(), isFalse);
      });

      test('Pas une carte haute (Quinte)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.carreau, Rang.neuf),
          Carte(Couleur.trefle, Rang.huit),
          Carte(Couleur.pique, Rang.sept),
          Carte(Couleur.coeur, Rang.six),
        ]);

        expect(main.carteHaute(), isFalse);
      });

      test('Pas une carte haute (Couleur/Flush)', () {
        final main = MainPoker([
          Carte(Couleur.coeur, Rang.as),
          Carte(Couleur.coeur, Rang.dix),
          Carte(Couleur.coeur, Rang.neuf),
          Carte(Couleur.coeur, Rang.sept),
          Carte(Couleur.coeur, Rang.deux),
        ]);

        expect(main.carteHaute(), isFalse);
      });
    });
  });
  group('Comparaison mains', () {
    test('Quinte Flush Royale vs Quinte Flush', () {
      final quinteFlushRoyale = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.coeur, Rang.valet),
        Carte(Couleur.coeur, Rang.dame),
        Carte(Couleur.coeur, Rang.roi),
        Carte(Couleur.coeur, Rang.as),
      ]);

      final quinteFlush = MainPoker([
        Carte(Couleur.coeur, Rang.neuf),
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.coeur, Rang.valet),
        Carte(Couleur.coeur, Rang.dame),
        Carte(Couleur.coeur, Rang.roi),
      ]);

      expect(quinteFlushRoyale.comparerMain(quinteFlush), 1);
    });

    test('Carré vs Full', () {
      final carre = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.dix),
        Carte(Couleur.coeur, Rang.as),
      ]);

      final fullHouse = MainPoker([
        Carte(Couleur.coeur, Rang.neuf),
        Carte(Couleur.carreau, Rang.neuf),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.pique, Rang.dame),
        Carte(Couleur.coeur, Rang.dame),
      ]);

      expect(carre.comparerMain(fullHouse), 1);
    });

    test('Paire plus forte vs paire plus faible', () {
      final paireDix = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.pique, Rang.sept),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      final paireNeuf = MainPoker([
        Carte(Couleur.coeur, Rang.neuf),
        Carte(Couleur.carreau, Rang.neuf),
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.pique, Rang.sept),
        Carte(Couleur.coeur, Rang.six),
      ]);

      expect(paireDix.comparerMain(paireNeuf), 1);
    });

    test('Deux mains identiques sont égales', () {
      final main1 = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.pique, Rang.sept),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      final main2 = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.pique, Rang.sept),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      expect(main1.comparerMain(main2), 0);
    });
    test('Deux carré', () {
      final main1 = MainPoker([
        Carte(Couleur.coeur, Rang.sept),
        Carte(Couleur.carreau, Rang.sept),
        Carte(Couleur.trefle, Rang.sept),
        Carte(Couleur.pique, Rang.sept),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      final main2 = MainPoker([
        Carte(Couleur.coeur, Rang.huit),
        Carte(Couleur.carreau, Rang.huit),
        Carte(Couleur.trefle, Rang.huit),
        Carte(Couleur.pique, Rang.huit),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      expect(main1.comparerMain(main2), -1);
    });
    test('2 cartes hautes', () {
      final main1 = MainPoker([
        Carte(Couleur.coeur, Rang.trois),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.pique, Rang.sept),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      final main2 = MainPoker([
        Carte(Couleur.coeur, Rang.as),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.pique, Rang.sept),
        Carte(Couleur.coeur, Rang.deux),
      ]);

      expect(main1.comparerMain(main2), -1);
    });
    test('2 Full avec brelan différent', () {
      final fullHouse1 = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.cinq),
        Carte(Couleur.coeur, Rang.cinq),
      ]);

      final fullHouse2 = MainPoker([
        Carte(Couleur.coeur, Rang.neuf),
        Carte(Couleur.carreau, Rang.neuf),
        Carte(Couleur.trefle, Rang.neuf),
        Carte(Couleur.pique, Rang.roi),
        Carte(Couleur.coeur, Rang.roi),
      ]);

      expect(fullHouse1.comparerMain(fullHouse2), 1);
    });
    test('2 Full avec paire différente', () {
      final fullHouse1 = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.cinq),
        Carte(Couleur.coeur, Rang.cinq),
      ]);

      final fullHouse2 = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.roi),
        Carte(Couleur.coeur, Rang.roi),
      ]);

      expect(fullHouse1.comparerMain(fullHouse2), -1);
    });
  });
}
