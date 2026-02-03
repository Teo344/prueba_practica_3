import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/palindromo_entity.dart';
import '../../domain/usecases/evaluar_palindromo_usecase.dart';

final palindromoViewModelProvider =
    Provider((ref) => PalindromoViewModel());

class PalindromoViewModel {
  final _usecase = EvaluarPalindromoUseCase();

  bool evaluar(PalindromoEntity entity) {
    return _usecase.execute(entity);
  }
}
