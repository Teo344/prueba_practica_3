import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.uva),
                child: const Text('Ejercicio Uva')),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.palindromo),
                child: const Text('Ejercicio Palíndromo')),
          ],
        ),
      ),
    );
  }
}
