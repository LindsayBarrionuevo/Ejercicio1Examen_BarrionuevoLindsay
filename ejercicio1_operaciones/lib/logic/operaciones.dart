class Operaciones {
  final int num1;
  final int num2;

  Operaciones({required this.num1, required this.num2});

  int suma() => num1 + num2;

  int resta() => num1 - num2;

  int multiplicacion() => num1 * num2;

  int division() => num2 != 0 ? num1 ~/ num2 : 0;

  int modulo() => num2 != 0 ? num1 % num2 : 0;

  Map<String, int?> operacionesInvertidas() {
    final Map<String, int?> resultadosInvertidos = {};
    if (num1 != num2) {
      resultadosInvertidos["resta"] = num2 - num1;
      resultadosInvertidos["division"] = num1 != 0 ? num2 ~/ num1 : null;
      resultadosInvertidos["modulo"] = num1 != 0 ? num2 % num1 : null;
    }
    return resultadosInvertidos;
  }
}
