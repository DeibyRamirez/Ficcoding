// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'Isosceles.dart';
import 'Lineal.dart';
import 'Preguntas.dart';
import 'Rectangulo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ejemplos(),
    );
  }
}

class Ejemplos extends StatefulWidget {
  const Ejemplos({Key? key}) : super(key: key);

  @override
  _EjemplosState createState() => _EjemplosState();
}

class _EjemplosState extends State<Ejemplos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "Fuerzas Eléctricas",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Preguntas(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Seleccione una representación del problema:",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  "Triángulo Rectángulo",
                  "assets/icon/rectangulo.jpg",
                  const Rectangulo(),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  "Triángulo Equilátero",
                  "assets/icon/equilatero.jpg",
                  const Isosceles(),
                ),
                const SizedBox(height: 20),
                _buildButton(
                  "Lineal",
                  "assets/icon/linea.jpg",
                  const Lineal(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, String imagePath, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: const EdgeInsets.all(15),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 300, // Establece la altura deseada para todas las imágenes
            child: Image.asset(
              imagePath,
              fit: BoxFit
                  .contain, // Ajusta la imagen dentro del espacio definido
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
