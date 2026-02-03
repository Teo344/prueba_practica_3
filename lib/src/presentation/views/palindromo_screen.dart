import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/palindromo_entity.dart';
import '../viewmodels/palindromo_viewmodel.dart';

class PalindromoScreen extends ConsumerStatefulWidget {
  const PalindromoScreen({super.key});

  @override
  ConsumerState<PalindromoScreen> createState() =>
      _PalindromoScreenState();
}

class _PalindromoScreenState
    extends ConsumerState<PalindromoScreen> {
  final ctrl = TextEditingController();
  String resultado = '';

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(palindromoViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Palíndromo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: ctrl),

            ElevatedButton(
              onPressed: () {
                final entity =
                    PalindromoEntity(ctrl.text);

                bool es = vm.evaluar(entity);

                setState(() {
                  resultado =
                      es ? 'Es palíndromo' : 'No es palíndromo';
                });
              },
              child: const Text('Evaluar'),
            ),

            Text(resultado)
          ],
        ),
      ),
    );
  }
}
