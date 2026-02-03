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
    final Color primaryColor = Colors.indigo.shade900;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PRECIO UVA', style: TextStyle(letterSpacing: 2, fontWeight: FontWeight.bold)),
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
              "Datos del lote",
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            
            // Campos de entrada sin iconos
            _buildSimpleField("Precio por Kilo", precioCtrl),
            const SizedBox(height: 20),
            _buildSimpleField("Cantidad de Kilos", kilosCtrl),
            
            const SizedBox(height: 30),

            // Selectores limpios
            Row(
              children: [
                Expanded(child: _buildSimpleDropdown("Tipo", tipo, ['A', 'B'], (v) => setState(() => tipo = v!))),
                const SizedBox(width: 20),
                Expanded(child: _buildSimpleDropdown("Tamaño", tamano, [1, 2], (v) => setState(() => tamano = v!))),
              ],
            ),

            const SizedBox(height: 40),

            // Botón Sólido
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: _calcularTotal,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text('CALCULAR TOTAL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),

            const SizedBox(height: 40),

            // Bloque de resultado sólido
            if (resultado > 0) _buildSimpleResult(),
          ],
        ),
      ),
    );
  }

  void _calcularTotal() {
    if (precioCtrl.text.isEmpty || kilosCtrl.text.isEmpty) return;

    final vm = ref.read(uvaViewModelProvider);
    final entity = UvaEntity(
      precioInicial: double.tryParse(precioCtrl.text) ?? 0,
      tipo: tipo,
      tamano: tamano,
      kilos: double.tryParse(kilosCtrl.text) ?? 0,
    );

    setState(() {
      resultado = vm.calcular(entity);
    });
  }

  Widget _buildSimpleField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(fontSize: 18),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildSimpleDropdown(String label, dynamic value, List<dynamic> items, Function(dynamic) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black54)),
        DropdownButton<dynamic>(
          value: value,
          isExpanded: true,
          underline: Container(height: 1, color: Colors.black26),
          items: items.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item is int ? "Tam. $item" : "Tipo $item"),
          )).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildSimpleResult() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.green.shade700,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Text("TOTAL CALCULADO", style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(
            "\$${resultado.toStringAsFixed(2)}",
            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}