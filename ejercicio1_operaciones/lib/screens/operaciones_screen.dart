import 'package:flutter/material.dart';
import '../logic/operaciones.dart';
import 'resultados.dart';

class RealizarOperacionesPage extends StatefulWidget {
  const RealizarOperacionesPage({super.key});

  @override
  State<RealizarOperacionesPage> createState() => _RealizarOperacionesPage();
}

class _RealizarOperacionesPage extends State<RealizarOperacionesPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  void _calcularYMostrarResultados() {
    if (_num1Controller.text.isEmpty || _num2Controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa ambos números')),
      );
      return;
    }

    final int? num1 = int.tryParse(_num1Controller.text);
    final int? num2 = int.tryParse(_num2Controller.text);

    if (num1 == null || num2 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa solo números enteros')),
      );
      return;
    }

    final operaciones = Operaciones(num1: num1, num2: num2);

    final resultados = {
      "Suma": operaciones.suma(),
      "Resta": operaciones.resta(),
      "Multiplicación": operaciones.multiplicacion(),
      "División": operaciones.division(),
      "Módulo": operaciones.modulo(),
    };

    final resultadosInvertidos = operaciones.operacionesInvertidas();

    if (num1 <= num2) {
      if (resultadosInvertidos["resta"] != null) {
        resultados["Resta Invertida"] = resultadosInvertidos["resta"]!;
      }
      if (resultadosInvertidos["division"] != null) {
        resultados["División Invertida"] = resultadosInvertidos["division"]!;
      }
      if (resultadosInvertidos["modulo"] != null) {
        resultados["Módulo Invertido"] = resultadosInvertidos["modulo"]!;
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadosPage(resultados: resultados),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Operaciones'),
        backgroundColor: Colors.purple.shade400,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(167, 199, 144, 209),
              Color.fromARGB(167, 179, 120, 189),
              Color.fromARGB(167, 90, 33, 100),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Ingresa dos números enteros para realizar operaciones matemáticas:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildInputField(
                  controller: _num1Controller,
                  label: 'Número 1',
                  icon: Icons.filter_1,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  controller: _num2Controller,
                  label: 'Número 2',
                  icon: Icons.filter_2,
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: _calcularYMostrarResultados,
                  icon: const Icon(Icons.calculate, size: 24),
                  label: const Text('Calcular y Ver Resultados'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade400,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.purple, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.purple.shade200!.withOpacity(0.5),
      ),
    );
  }
}
