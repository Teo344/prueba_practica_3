import 'package:flutter/material.dart';
import '../views/palindromo_screen.dart';
import '../views/uva_screen.dart';

class AppRoutes {
  static const uva = '/uva';
  static const palindromo = '/palindromo';

  static Map<String, WidgetBuilder> routes = {
    uva: (_) => const UvaScreen(),
    palindromo: (_) => const PalindromoScreen(),
  };
}
