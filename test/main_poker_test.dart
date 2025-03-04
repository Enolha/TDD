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
  });
}
