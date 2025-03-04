import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/main.dart';

void main() {
  test('creer une carte', () {
    final carte = Carte(Couleur.coeur, Rang.as);

    expect(carte.couleur, Couleur.coeur);
    expect(carte.rang, Rang.as);
    expect(carte.toString(), 'Carte(rang: 14, couleur: coeur)');
  });
}
