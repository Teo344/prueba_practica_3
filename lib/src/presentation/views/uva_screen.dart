import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/uva_entity.dart';
import '../viewmodels/uva_viewmodel.dart';

class UvaScreen extends ConsumerStatefulWidget {
  const UvaScreen({super.key});

  @override
  ConsumerState<UvaScreen> createState() => _UvaScreenState();
}

class _UvaScreenState extends ConsumerState<UvaScreen> {
  final precioCtrl = TextEditingController();
  final kilosCtrl = TextEditingController();

  String tipo = 'A';
  int tamano = 1;
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(uvaViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Precio Uva')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: precioCtrl),
            TextField(controller: kilosCtrl),

            DropdownButton(
              value: tipo,
              items: const [
                DropdownMenuItem(value: 'A', child: Text('Tipo A')),
                DropdownMenuItem(value: 'B', child: Text('Tipo B')),
              ],
              onChanged: (v) => setState(() => tipo = v!),
            ),

            DropdownButton(
              value: tamano,
              items: const [
                DropdownMenuItem(value: 1, child: Text('Tamaño 1')),
                DropdownMenuItem(value: 2, child: Text('Tamaño 2')),
              ],
              onChanged: (v) => setState(() => tamano = v!),
            ),

            ElevatedButton(
              onPressed: () {
                final entity = UvaEntity(
                  precioInicial:
                      double.parse(precioCtrl.text),
                  tipo: tipo,
                  tamano: tamano,
                  kilos: double.parse(kilosCtrl.text),
                );

                setState(() {
                  resultado = vm.calcular(entity);
                });
              },
              child: const Text('Calcular'),
            ),

            Text('Total: \$${resultado.toStringAsFixed(2)}')
          ],
        ),
      ),
    );
  }
}
