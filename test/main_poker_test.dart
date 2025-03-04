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

      expect(main.Carre(), isTrue);
    });

    test('Pas un carré (trois cartes identiques seulement)', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.dix),
        Carte(Couleur.carreau, Rang.dix),
        Carte(Couleur.trefle, Rang.dix),
        Carte(Couleur.pique, Rang.neuf),
        Carte(Couleur.coeur, Rang.as),
      ]);

      expect(main.Carre(), isFalse);
    });

    test('Pas un carré (toutes les cartes différentes', () {
      final main = MainPoker([
        Carte(Couleur.coeur, Rang.deux),
        Carte(Couleur.carreau, Rang.quatre),
        Carte(Couleur.trefle, Rang.six),
        Carte(Couleur.pique, Rang.huit),
        Carte(Couleur.coeur, Rang.dix),
      ]);

      expect(main.Carre(), isFalse);
    });
  });
}
