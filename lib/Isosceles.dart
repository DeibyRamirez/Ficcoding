// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:ficcoding/CalFuerzasIsosceles.dart';
import 'package:flutter/material.dart';

class Isosceles extends StatefulWidget {
  const Isosceles({Key? key}) : super(key: key);

  @override
  _IsoscelesState createState() => _IsoscelesState();
}

class _IsoscelesState extends State<Isosceles> {
  final TextEditingController carga1Controller = TextEditingController();
  final TextEditingController carga2Controller = TextEditingController();
  final TextEditingController carga3Controller = TextEditingController();
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController cargaTrabajoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "TRIÁNGULO EQUILATERO",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/icon/equilatero.jpg"),
            const SizedBox(height: 20),
            const Text(
              "Digite los valores de las cargas, Coulombs (C):",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: carga1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Carga 1 (q1)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: carga2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Carga 2 (q2)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: carga3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Carga 3 (q3)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Digite el valor de la distancia en metros (m):",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'De (q1) a (q2)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Digite la carga (q) a trabajar:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: cargaTrabajoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'q1? q2? q3?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validar que todos los campos estén completos
                if (carga1Controller.text.isEmpty ||
                    carga2Controller.text.isEmpty ||
                    carga3Controller.text.isEmpty ||
                    distanciaController.text.isEmpty ||
                    cargaTrabajoController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Por favor complete todos los campos.'),
                  ));
                  return;
                }

                // Obtener los valores de los controladores
                final carga1 = double.parse(carga1Controller.text);
                final carga2 = double.parse(carga2Controller.text);
                final carga3 = double.parse(carga3Controller.text);
                final distancia = double.parse(distanciaController.text);
                final cargaTrabajo =
                    int.tryParse(cargaTrabajoController.text) ?? 0;

                if (distancia <= 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content:
                          const Text("Las distancias deben ser mayores a 0."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                  return;
                }
                if (carga1 == 0 || carga2 == 0 || carga3 == 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content:
                          const Text("Las cargas no deben ser iguales a 0."),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CalFuerzasIsosceles(
                      carga1: carga1,
                      carga2: carga2,
                      carga3: carga3,
                      distancia: distancia,
                      cargaTrabajo: cargaTrabajo,
                      angulo: 60,
                    ),
                  ),
                );
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.orangeAccent)),
              child: const Text("Calcular"),
            )
          ],
        ),
      ),
    );
  }
}
