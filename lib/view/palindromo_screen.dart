import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodel/palindromo_viewmodel.dart';

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
    final vm = ref.read(palindromoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Palíndromo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: ctrl,
              decoration: const InputDecoration(
                  labelText: 'Ingrese palabra'),
            ),
            ElevatedButton(
                onPressed: () {
                  bool es = vm.evaluar(ctrl.text);
                  setState(() {
                    resultado =
                        es ? 'Es palíndromo' : 'No es palíndromo';
                  });
                },
                child: const Text('Evaluar')),
            Text(resultado)
          ],
        ),
      ),
    );
  }
}
