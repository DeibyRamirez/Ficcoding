// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:ficcoding/CalFuerzasRectangulo.dart'; // Importa el archivo CalFuerzasRectangulo.dart

class Rectangulo extends StatefulWidget {
  const Rectangulo({Key? key}) : super(key: key);

  @override
  _RectanguloState createState() => _RectanguloState();
}

class _RectanguloState extends State<Rectangulo> {
  TextEditingController carga1Controller = TextEditingController();
  TextEditingController carga2Controller = TextEditingController();
  TextEditingController carga3Controller = TextEditingController();
  TextEditingController distancia12Controller = TextEditingController();
  TextEditingController distancia23Controller = TextEditingController();
  TextEditingController distancia13Controller = TextEditingController();
  TextEditingController cargaTrabajoController = TextEditingController();
  TextEditingController anguloController = TextEditingController();

  @override
  void dispose() {
    // Dispose los controladores al finalizar
    carga1Controller.dispose();
    carga2Controller.dispose();
    carga3Controller.dispose();
    distancia12Controller.dispose();
    distancia23Controller.dispose();
    distancia13Controller.dispose();
    cargaTrabajoController.dispose();
    anguloController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          "TRIÁNGULO RECTÁNGULO",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/icon/rectangulo.jpg"),
              const SizedBox(height: 20),
              const Text(
                "Digite los valores de las cargas, Coulombs (C):",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: carga1Controller,
                decoration: const InputDecoration(
                  labelText: 'Carga 1 (q1)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: carga2Controller,
                decoration: const InputDecoration(
                  labelText: 'Carga 2 (q2)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: carga3Controller,
                decoration: const InputDecoration(
                  labelText: 'Carga 3 (q3)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 50),
              const Text(
                "Digite el valor de la distancia en metros (m):",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: distancia12Controller,
                decoration: const InputDecoration(
                  labelText: 'De (q1) a (q2), Lado opuesto',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: distancia23Controller,
                decoration: const InputDecoration(
                  labelText: 'De (q2) a (q3), Lado Adyacente',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: distancia13Controller,
                decoration: const InputDecoration(
                  labelText: 'De (q1) a (q3), Usa Pitagoras...',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 50),
              const Text(
                "Digite la carga (q) a trabajar:",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: cargaTrabajoController,
                decoration: const InputDecoration(
                  labelText: 'q1? q2? q3?',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 10),
              const Text(
                "Digite el ángulo:",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: anguloController,
                decoration: const InputDecoration(
                  labelText: 'ʘ?, Usa [Tan^-1(opuesto/Adyacente)]',
                  border: OutlineInputBorder(),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // Obtener los valores de los TextField
                  double carga1 = double.tryParse(carga1Controller.text) ?? 0;
                  double carga2 = double.tryParse(carga2Controller.text) ?? 0;
                  double carga3 = double.tryParse(carga3Controller.text) ?? 0;
                  double distancia12 =
                      double.tryParse(distancia12Controller.text) ?? 0;
                  double distancia23 =
                      double.tryParse(distancia23Controller.text) ?? 0;
                  double distancia13 =
                      double.tryParse(distancia13Controller.text) ?? 0;
                  int cargaTrabajo =
                      int.tryParse(cargaTrabajoController.text) ?? 0;
                  double angulo = double.tryParse(anguloController.text) ?? 0;

                  // Validar que los valores no sean 0 o negativos
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

                  // Navegar a la pantalla de cálculo
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalFuerzasRectangulo(
                        carga1: carga1,
                        carga2: carga2,
                        carga3: carga3,
                        distancia12: distancia12,
                        distancia23: distancia23,
                        distancia13: distancia13,
                        cargaTrabajo: cargaTrabajo,
                        angulo: angulo,
                      ),
                    ),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Colors.orangeAccent)),
                child: const Text("Calcular"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
