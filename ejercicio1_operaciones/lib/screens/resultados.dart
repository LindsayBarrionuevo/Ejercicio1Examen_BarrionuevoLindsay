import 'package:flutter/material.dart';

class ResultadosPage extends StatelessWidget {
  final Map<String, dynamic> resultados;

  const ResultadosPage({super.key, required this.resultados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Resultados de las Operaciones',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: resultados.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final key = resultados.keys.elementAt(index);
                  final value = resultados[key];

                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: Icon(
                        _getIconForKey(key),
                        color: Colors.teal,
                        size: 30,
                      ),
                      title: Text(
                        key,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        value.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para elegir íconos basados en la operación
  IconData _getIconForKey(String key) {
    switch (key.toLowerCase()) {
      case "suma":
        return Icons.add;
      case "resta":
        return Icons.remove;
      case "multiplicación":
        return Icons.close;
      case "división":
        return Icons.horizontal_rule;
      case "módulo":
        return Icons.percent;
      case "resta invertida":
      case "división invertida":
      case "módulo invertido":
        return Icons.swap_vert;
      default:
        return Icons.calculate;
    }
  }
}
