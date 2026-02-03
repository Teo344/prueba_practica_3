import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú Principal"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            /// BOTON UVA
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.uva);
                },
                child: const Text("Ejercicio 1 - Precio Uva"),
              ),
            ),

            const SizedBox(height: 20),

            /// BOTON PALINDROMO
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRoutes.palindromo);
                },
                child: const Text("Ejercicio 2 - Palíndromo"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
