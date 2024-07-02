// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Quehacer extends StatelessWidget {
  const Quehacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Que debo hacer ?'),
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
            _buildPaso("Paso 4:", "Usar las componentes de los vectores",
                "Debes usar el boton '' ingresar los signos '' y luego usar los botones de + y - para dar a entender el sentido de la componentes, tu elección estara demarcada por el color naranja, dependiendo de la combinacion de los botones la App te entregara el resultado.")
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
