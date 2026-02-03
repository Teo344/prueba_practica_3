import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/uva_model.dart';

final uvaProvider = Provider((ref) => UvaViewModel());

class UvaViewModel {
  final _model = UvaModel();

  double calcular(
      double precio, String tipo, int tamano, double kilos) {
    return _model.calcularPrecio(
      precioInicial: precio,
      tipo: tipo,
      tamano: tamano,
      kilos: kilos,
    );
  }
}
