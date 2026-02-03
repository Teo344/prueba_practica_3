import 'package:flutter/material.dart';

import '../views/home_screen.dart';
import '../views/uva_screen.dart';
import '../views/palindromo_screen.dart';

class AppRoutes {
  static const home = '/';
  static const uva = '/uva';
  static const palindromo = '/palindromo';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    uva: (_) => const UvaScreen(),
    palindromo: (_) => const PalindromoScreen(),
  };
}
