import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_practica_3/src/domain/entities/palindromo_entity.dart';
import 'package:prueba_practica_3/src/domain/usecases/evaluar_palindromo_usecase.dart';

void main() {
  late EvaluarPalindromoUseCase usecase;

  setUp(() {
    usecase = EvaluarPalindromoUseCase();
  });

  group('Grupo 1 - Pruebas Correctas', () {
    test('Prueba 1 - Palindromo simple', () {
      print('\n Prueba 1 - Palindromo simple');

      final entity = PalindromoEntity('ana');

      print('Datos de entrada: palabra: ana');
      final result = usecase.execute(entity);

      expect(result, true, reason: 'ana debe ser un palindromo');

      print('Prueba 1 Pasada');
    });

    test('Prueba 2 - Palindromo con espacios', () {
      print('\n Prueba 2 - Palindromo con espacios');

      final entity = PalindromoEntity('a man a plan a canal panama');

      print('Datos de entrada: palabra: a man a plan a canal panama');
      final result = usecase.execute(entity);

      expect(result, true, reason: 'Debe ignorar espacios y ser palindromo');

      print('Prueba 2 Pasada');
    });

    test('Prueba 3 - No es palindromo', () {
      print('\n Prueba 3 - No es palindromo');

      final entity = PalindromoEntity('hola');

      print('Datos de entrada: palabra: hola');
      final result = usecase.execute(entity);

      expect(result, false, reason: 'hola no es un palindromo');

      print('Prueba 3 Pasada');
    });
  });
}