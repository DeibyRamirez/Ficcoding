// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Preguntas extends StatelessWidget {
  const Preguntas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Cómo usar la aplicación'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPaso("Paso 1:", "Preparación inicial",
                "Primero, asegúrate de tener tu ejercicio físico, un cuaderno y un lápiz a mano."),
            _buildPaso("Paso 2:", "Graficar el problema",
                "Luego, procede a graficar el problema. Esto te permitirá visualizar las cargas y sus posiciones, lo cual es fundamental para entender los efectos de atracción y repulsión entre ellas."),
            _buildPaso("Paso 3:", "Identificar fuerzas",
                "Con los datos obtenidos del paso anterior, utiliza la información para identificar las componentes de los vectores de las fuerzas presentes en el sistema."),
          ],
        ),
      ),
    );
  }

  Widget _buildPaso(String titulo, String subtitulo, String descripcion) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          subtitulo,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700]),
        ),
        const SizedBox(height: 4),
        Text(
          descripcion,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
