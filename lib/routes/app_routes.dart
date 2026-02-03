import 'package:flutter/material.dart';
import '../view/menu_screen.dart';
import '../view/uva_screen.dart';
import '../view/palindromo_screen.dart';

class AppRoutes {
  static const menu = '/';
  static const uva = '/uva';
  static const palindromo = '/palindromo';

  static Map<String, WidgetBuilder> routes = {
    menu: (_) => const MenuScreen(),
    uva: (_) => const UvaScreen(),
    palindromo: (_) => const PalindromoScreen(),
  };
}
