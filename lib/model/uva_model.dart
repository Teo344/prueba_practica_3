class UvaModel {
  double calcularPrecio({
    required double precioInicial,
    required String tipo,
    required int tamano,
    required double kilos,
  }) {
    double precioFinal = precioInicial;

    if (tipo == 'A') {
      if (tamano == 1) {
        precioFinal += 0.20;
      } else {
        precioFinal += 0.30;
      }
    } else if (tipo == 'B') {
      if (tamano == 1) {
        precioFinal -= 0.30;
      } else {
        precioFinal -= 0.50;
      }
    }

    return precioFinal * kilos;
  }
}
