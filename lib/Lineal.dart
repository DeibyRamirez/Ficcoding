// ignore_for_file: file_names, unused_import, library_private_types_in_public_api

import 'package:ficcoding/CalFuerzasLinela.dart';
import 'package:flutter/material.dart';

class Lineal extends StatefulWidget {
  const Lineal({Key? key}) : super(key: key);

  @override
  _LinealState createState() => _LinealState();
}

class _LinealState extends State<Lineal> {
  final TextEditingController carga1Controller = TextEditingController();
  final TextEditingController carga2Controller = TextEditingController();
  final TextEditingController carga3Controller = TextEditingController();
  final TextEditingController distancia12Controller = TextEditingController();
  final TextEditingController distancia23Controller = TextEditingController();
  final TextEditingController distancia13Controller = TextEditingController();
  final TextEditingController cargaTrabajoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "LINEAL",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/icon/linea.jpg"),
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
                controller: distancia12Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'De (q1) a (q2)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: distancia23Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'De (q2) a (q3)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: distancia13Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'De (q1) a (q3)',
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
                      distancia12Controller.text.isEmpty ||
                      distancia23Controller.text.isEmpty ||
                      distancia13Controller.text.isEmpty ||
                      cargaTrabajoController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Por favor complete todos los campos.'),
                    ));
                    return;
                  }

                  // Obtener los valores de los controladores
                  final double carga1 =
                      double.tryParse(carga1Controller.text) ?? 0;
                  final double carga2 =
                      double.tryParse(carga2Controller.text) ?? 0;
                  final double carga3 =
                      double.tryParse(carga3Controller.text) ?? 0;

                  final double distancia12 =
                      double.parse(distancia12Controller.text);
                  final double distancia23 =
                      double.parse(distancia23Controller.text);
                  final double distancia13 =
                      double.parse(distancia13Controller.text);
                  final cargaTrabajo =
                      int.tryParse(cargaTrabajoController.text) ?? 0;

                  if (distancia12 <= 0 ||
                      distancia23 <= 0 ||
                      distancia13 <= 0) {
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
                      builder: (context) => CalcularL(
                        carga1: carga1,
                        carga2: carga2,
                        carga3: carga3,
                        distancia12: distancia12,
                        distancia23: distancia23,
                        distancia13: distancia13,
                        cargaTrabajo: cargaTrabajo,
                      ),
                    ),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.orangeAccent)),
                child: const Text("Calcular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
