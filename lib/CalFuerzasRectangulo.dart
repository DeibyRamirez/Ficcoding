// ignore_for_file: unused_local_variable, file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:math';
import 'package:ficcoding/Quehacer.dart';
import 'package:flutter/material.dart';

class CalFuerzasRectangulo extends StatefulWidget {
  final int cargaTrabajo;
  final double carga1;
  final double carga2;
  final double carga3;
  final double distancia12;
  final double distancia23;
  final double distancia13;

  final double angulo;

  const CalFuerzasRectangulo({
    Key? key,
    required this.cargaTrabajo,
    required this.carga1,
    required this.carga2,
    required this.carga3,
    required this.angulo,
    required this.distancia12,
    required this.distancia23,
    required this.distancia13,
  }) : super(key: key);

  @override
  _CalFuerzasRectanguloState createState() => _CalFuerzasRectanguloState();
}

class _CalFuerzasRectanguloState extends State<CalFuerzasRectangulo> {
  String mensajeResultadoC1 = '';
  String mensajeResultadoC2 = '';
  String mensajeResultadoC3 = '';
  String mensajeComponentesC1 = '';

  String mensajeComponentesC3 = '';
  String mensajeFresultanteC1 = '';
  String mensajeFresultanteC2 = '';
  String mensajeFresultanteC3 = '';
  String mensajesumasC1 = '';
  String mensajesumasC2 = '';
  String mensajesumasC3 = '';

  int signoX1 = 1;
  int signoY1 = 1;
  int signoX2 = 1;
  int signoY2 = 1;
  int signo1 = 1;
  int signo2 = 1;

  void actualizarMensajes() {
    double fuerza12 =
        calcularFuerza(widget.carga1, widget.carga2, widget.distancia12);
    double fuerza13 =
        calcularFuerza(widget.carga1, widget.carga3, widget.distancia13);

    double f1componenteX = componentesX(fuerza12 * signoX1, widget.angulo);
    double f1componenteY = componentesY(fuerza12 * signoY1, widget.angulo);

    double f2componenteX = componentesX(fuerza13 * signoX2, widget.angulo);
    double f2componenteY = componentesY(fuerza13 * signoY2, widget.angulo);

    mensajeResultadoC1 =
        "Fuerza entre cargas 1 y 2: $fuerza12 N\nFuerza entre cargas 1 y 3: $fuerza13 N";

    mensajeComponentesC1 =
        "Componentes de la Fuerza (1,3): X = $f2componenteX, Y = $f2componenteY";

    double fuerzaresultanteX = fuerza12 + f2componenteX;
    double fuerzaresultanteY = fuerza12 + f2componenteY; //En duda'''

    mensajesumasC1 =
        "La suma de la fuerzas en X es: $fuerzaresultanteX\n La suma de la fuerzas en Y es: $fuerzaresultanteY ";

    double fuerzaresultante = Fresultante(fuerzaresultanteX, fuerzaresultanteY);

    mensajeFresultanteC1 = "Fuerza resultante: $fuerzaresultante N";
    ////////////////////////////////////////////

    double fuerza21 =
        calcularFuerza(widget.carga1, widget.carga2, widget.distancia12);
    double fuerza23 =
        calcularFuerza(widget.carga2, widget.carga3, widget.distancia23);

    double fuerza21signo = fuerza21 * signo1;
    double fuerza23signo = fuerza23 * signo2;

    mensajeResultadoC2 =
        " Fuerza entre cargas 2 y 1: $fuerza21signo N\n\n Fuerza entre cargas 2 y 3: $fuerza23signo N";

    mensajesumasC2 = " $fuerza21signo + $fuerza23signo ";

    double fuerzaresultanteC2 = Fresultantecaso2(fuerza21signo, fuerza23signo);

    mensajeFresultanteC2 = "Fuerza resultante: $fuerzaresultanteC2 N"; //Melo

    /////////////////////////////////////////////

    double fuerza31 =
        calcularFuerza(widget.carga1, widget.carga3, widget.distancia13);
    double fuerza32 =
        calcularFuerza(widget.carga2, widget.carga3, widget.distancia23);

    double f1componenteXC3 = componentesX(fuerza31 * signoX1, widget.angulo);
    double f1componenteYC3 = componentesY(fuerza31 * signoY1, widget.angulo);

    mensajeResultadoC3 =
        "Fuerza entre cargas 3 y 1: $fuerza31 N\nFuerza entre cargas 3 y 2: $fuerza32 N";

    mensajeComponentesC3 =
        "Componentes de la Fuerza (3,1): \n\nX = $f1componenteXC3 \nY = $f1componenteYC3 ";

    double fuerzaresultanteXC3 = f1componenteXC3 + fuerza32;
    double fuerzaresultanteYC3 = f1componenteYC3 +
        0; //Puede ser por (-1)  falta el caso 3 y el trianfulo y el lineal, (TODO)...

    double fuerzaresultanteC3 =
        Fresultante(fuerzaresultanteXC3, fuerzaresultanteYC3);

    mensajeFresultanteC3 = "Fuerza resultante: $fuerzaresultanteC3 N";
    mensajesumasC3 =
        "La suma de la fuerzas en X es: $fuerzaresultanteXC3\n La suma de la fuerzas en Y es: $fuerzaresultanteYC3 ";
  }

  double calcularFuerza(double q1, double q2, double r) {
    const k = 8990000000; // Constante de Coulomb en Nm²/C²
    q2 = q2.abs();
    q1 = q1.abs();
    return k * (q1 * q2) / pow(r, 2); // Fórmula de Coulomb
  }

  double componentesX(double fuerza, double angulo) {
    double anguloRadianes = angulo * (pi / 180); // Convertir a radianes
    double componenteX = fuerza * cos(anguloRadianes);
    return componenteX; // Retorna la componente X
  }

  double componentesY(double fuerza, double angulo) {
    double anguloRadianes = angulo * (pi / 180); // Convertir a radianes
    double componenteY = fuerza * sin(anguloRadianes); // Utiliza la función sin
    return componenteY; // Retorna la componente Y
  }

  double Fresultante(double componentex, double componentey) {
    double Ft = sqrt(pow(componentex, 2) + pow(componentey, 2));
    return Ft;
  }

  double Fresultantecaso2(double fuerza1, double fuerza2) {
    double Ft = fuerza1 + fuerza2;
    return Ft;
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.cargaTrabajo) {
      case 1:
        return _buildCase1();
      case 2:
        return _buildCase2();
      case 3:
        return _buildCase3();
      default:
        return Scaffold(
          appBar: AppBar(
            title: const Text("Fuerza Eléctrica"),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('Carga de trabajo no válida'),
          ),
        );
    }
  }

  Widget _buildCase2() {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Fuerza Eléctrica"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Quehacer(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Fuerzas:",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                mensajeResultadoC2,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ]),
                      ),
                      const SizedBox(height: 20),
                      Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(children: [
                              const Text("Digite el sentido de las Fuerzas:",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 20),
                              const Text(
                                  " - Digite el sentido de la Fuerza (2 y 1)"),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        signo1 = 1;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: signo1 == 1
                                          ? Colors.orange
                                          : Colors.blue,
                                    ),
                                    child: const Text("+"),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        signo1 = -1;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: signo1 == -1
                                          ? Colors.orange
                                          : Colors.blue,
                                    ),
                                    child: const Text("-"),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                  " - Digite el sentido de la Fuerza (2 y 3)"),
                              const SizedBox(width: 20),
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        signo2 = 1;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: signo2 == 1
                                          ? Colors.orange
                                          : Colors.blue,
                                    ),
                                    child: const Text("+"),
                                  ),
                                  const SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        signo2 = -1;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: signo2 == -1
                                          ? Colors.orange
                                          : Colors.blue,
                                    ),
                                    child: const Text("-"),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ]),
                          )),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            actualizarMensajes();
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.orange),
                          elevation: WidgetStateProperty.all(10),
                        ),
                        child: const Text("Ingresar los signos"),
                      ),
                      Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Sumas:",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  mensajesumasC2,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Fuerza Resultante:",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                mensajeFresultanteC2,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]))));
  }

//////////////////////////////////////////////////////////////////////////////////////////
  Widget _buildCase1() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Fuerza Eléctrica"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Quehacer(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fuerzas:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajeResultadoC1,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Digite el sentido de las componentes:",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildForceComponent("Fuerza (1 y 3)", signoX2, signoY2,
                  (newX, newY) {
                setState(() {
                  signoX2 = newX;
                  signoY2 = newY;
                });
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    actualizarMensajes();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.orange),
                  elevation: WidgetStateProperty.all(10),
                ),
                child: const Text("Ingresar los signos"),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Componentes:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajeComponentesC1,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sumas:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajesumasC1,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fuerza Resultante:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajeFresultanteC1,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForceComponent(
      String title, int signoX, int signoY, Function(int, int) onSignoChanged) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(" - Componente X: "),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(1, signoY);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoX == 1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("+"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(-1, signoY);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoX == -1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(" - Componente Y: "),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(signoX, 1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoY == 1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("+"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(signoX, -1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoY == -1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCase3() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Fuerza Eléctrica"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Quehacer(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fuerzas:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajeResultadoC3,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Digite el sentido de las componentes:",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildForceComponent3("Fuerza (3 y 1)", signoX1, signoY1,
                  (newX, newY) {
                setState(() {
                  signoX1 = newX;
                  signoY1 = newY;
                });
              }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    actualizarMensajes();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.orange),
                  elevation: WidgetStateProperty.all(10),
                ),
                child: const Text("Ingresar los signos"),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Componentes:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajeComponentesC3,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sumas:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajesumasC3,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fuerza Resultante:",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mensajeFresultanteC3,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForceComponent3(
      String title, int signoX, int signoY, Function(int, int) onSignoChanged) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(" - Componente X: "),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(1, signoY);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoX == 1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("+"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(-1, signoY);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoX == -1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("-"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(" - Componente Y: "),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(signoX, 1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoY == 1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("+"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onSignoChanged(signoX, -1);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: signoY == -1 ? Colors.orange : Colors.blue,
                  ),
                  child: const Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
