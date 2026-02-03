import '../entities/uva_entity.dart';

class CalcularPrecioUvaUseCase {
  double execute(UvaEntity uva) {
    double precioFinal = uva.precioInicial;

    if (uva.tipo == 'A') {
      if (uva.tamano == 1) {
        precioFinal += 0.20;
      } else {
        precioFinal += 0.30;
      }
    } else if (uva.tipo == 'B') {
      if (uva.tamano == 1) {
        precioFinal -= 0.30;
      } else {
        precioFinal -= 0.50;
      }
    }

    return precioFinal * uva.kilos;
  }
}
