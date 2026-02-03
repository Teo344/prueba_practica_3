import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_practica_3/src/domain/entities/uva_entity.dart';
import 'package:prueba_practica_3/src/domain/usecases/calcular_precio_uva_usecase.dart';

void main() {
  late CalcularPrecioUvaUseCase usecase;

  setUp(() {
    usecase = CalcularPrecioUvaUseCase();
  });

  group('Grupo 1 - Pruebas Correctas', () {
    test('Prueba 1 - Tipo A, Tamaño 1', () {
      print('\n Prueba 1 - Tipo A, Tamaño 1');

      final entity = UvaEntity(
        precioInicial: 10.0,
        tipo: 'A',
        tamano: 1,
        kilos: 2.0,
      );

      print('Datos de entrada: precioInicial: 10.0, tipo: A, tamano: 1, kilos: 2.0');
      final total = usecase.execute(entity);

      expect(total, closeTo(20.4, 0.001), reason: 'El total debe ser (10 + 0.20) * 2 = 20.4');

      print('Prueba 1 Pasada');
    });

    test('Prueba 2 - Tipo A, Tamaño 2', () {
      print('\n Prueba 2 - Tipo A, Tamaño 2');

      final entity = UvaEntity(
        precioInicial: 10.0,
        tipo: 'A',
        tamano: 2,
        kilos: 1.0,
      );

      print('Datos de entrada: precioInicial: 10.0, tipo: A, tamano: 2, kilos: 1.0');
      final total = usecase.execute(entity);

      expect(total, closeTo(10.3, 0.001), reason: 'El total debe ser (10 + 0.30) * 1 = 10.3');

      print('Prueba 2 Pasada');
    });

    test('Prueba 3 - Tipo B, Tamaño 1', () {
      print('\n Prueba 3 - Tipo B, Tamaño 1');

      final entity = UvaEntity(
        precioInicial: 10.0,
        tipo: 'B',
        tamano: 1,
        kilos: 2.0,
      );

      print('Datos de entrada: precioInicial: 10.0, tipo: B, tamano: 1, kilos: 2.0');
      final total = usecase.execute(entity);

      expect(total, closeTo(19.4, 0.001), reason: 'El total debe ser (10 - 0.30) * 2 = 19.4');

      print('Prueba 3 Pasada');
    });
  });
}