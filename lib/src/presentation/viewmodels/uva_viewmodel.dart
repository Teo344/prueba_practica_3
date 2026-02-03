import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/uva_entity.dart';
import '../../domain/usecases/calcular_precio_uva_usecase.dart';

final uvaViewModelProvider =
    Provider((ref) => UvaViewModel());

class UvaViewModel {
  final _usecase = CalcularPrecioUvaUseCase();

  double calcular(UvaEntity entity) {
    return _usecase.execute(entity);
  }
}
