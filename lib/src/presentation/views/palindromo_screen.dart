import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/palindromo_entity.dart';
import '../viewmodels/palindromo_viewmodel.dart';

class PalindromoScreen extends ConsumerStatefulWidget {
  const PalindromoScreen({super.key});

  @override
  ConsumerState<PalindromoScreen> createState() => _PalindromoScreenState();
}

class _PalindromoScreenState extends ConsumerState<PalindromoScreen> {
  final ctrl = TextEditingController();
  String resultado = '';
  bool? esPalindromo;

  @override
  Widget build(BuildContext context) {
    final vm = ref.read(palindromoViewModelProvider);
    final Color primaryColor = Colors.blueGrey.shade900;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('ANALIZADOR', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Verificador de texto",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40),
            
            // Campo de entrada minimalista
            TextField(
              controller: ctrl,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                hintText: "Ingrese palabra",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor, width: 2),
                ),
              ),
            ),
            
            const SizedBox(height: 50),

            // Botón sólido
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: _evaluarPalabra,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text('VERIFICAR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 50),

            // Resultado en bloque de color sólido
            if (esPalindromo != null) _buildSimpleResult(),
          ],
        ),
      ),
    );
  }

  void _evaluarPalabra() {
    if (ctrl.text.trim().isEmpty) return;
    final vm = ref.read(palindromoViewModelProvider);
    final entity = PalindromoEntity(ctrl.text);
    final bool es = vm.evaluar(entity);

    setState(() {
      esPalindromo = es;
      resultado = es ? 'ES PALÍNDROMO' : 'NO ES PALÍNDROMO';
    });
  }

  Widget _buildSimpleResult() {
    final bool isTrue = esPalindromo!;
    final Color statusColor = isTrue ? Colors.green.shade700 : Colors.red.shade700;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: statusColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        resultado,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}