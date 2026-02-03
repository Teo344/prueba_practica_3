import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/palindromo_model.dart';

final palindromoProvider = Provider((ref) => PalindromoViewModel());

class PalindromoViewModel {
  final _model = PalindromoModel();

  bool evaluar(String palabra) {
    return _model.esPalindromo(palabra);
  }
}
