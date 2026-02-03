class PalindromoModel {
  bool esPalindromo(String palabra) {
    palabra = palabra.toLowerCase().replaceAll(" ", "");

    int inicio = 0;
    int fin = palabra.length - 1;

    while (inicio < fin) {
      if (palabra[inicio] != palabra[fin]) {
        return false;
      }
      inicio++;
      fin--;
    }

    return true;
  }
}
