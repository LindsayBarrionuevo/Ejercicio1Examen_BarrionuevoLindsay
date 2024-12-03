import 'package:flutter/material.dart';

class ResultadosPage extends StatelessWidget {
  final Map<String, dynamic> resultados;

  const ResultadosPage({super.key, required this.resultados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Color.fromARGB(167, 90, 33, 100),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(167, 199, 144, 209),
              Color.fromARGB(167, 179, 120, 189),
              Color.fromARGB(167, 90, 33, 100),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Resultados de las Operaciones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: resultados.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.white,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final key = resultados.keys.elementAt(index);
                  final value = resultados[key];

                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.purple.shade50,
                    child: ListTile(
                      leading: Icon(
                        _getIconForKey(key),
                        color: Colors.deepPurple,
                        size: 30,
                      ),
                      title: Text(
                        key,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      subtitle: Text(
                        value.toString(),
                        style: const TextStyle(fontSize: 16, color: Colors.black87),
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
