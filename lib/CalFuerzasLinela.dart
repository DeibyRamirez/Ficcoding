// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, file_names, library_private_types_in_public_api, non_constant_identifier_names

import 'dart:math';
import 'package:ficcoding/Quehacer.dart';
import 'package:flutter/material.dart';

class CalcularL extends StatefulWidget {
  final int cargaTrabajo;
  final double carga1;
  final double carga2;
  final double carga3;
  final double distancia12;
  final double distancia13;
  final double distancia23;

  double fuerza12 = 0;
  double fuerza13 = 0;
  double fuerza23 = 0;
  CalcularL(
      {Key? key,
      required this.cargaTrabajo,
      required this.carga1,
      required this.carga2,
      required this.carga3,
      required this.distancia12,
      required this.distancia13,
      required this.distancia23});

  @override
  _CalcularLState createState() => _CalcularLState();
}

class _CalcularLState extends State<CalcularL> {
  String mensajeResultadoC1 = '';
  String mensajeResultadoC2 = '';
  String mensajeResultadoC3 = '';
  String mensajesignoC1 = '';
  String mensajesignoC2 = '';
  String mensajesignoC3 = '';
  String mensajeFresultanteC1 = '';
  String mensajeFresultanteC2 = '';
  String mensajeFresultanteC3 = '';
  String mensajesumasC1 = '';
  String mensajesumasC2 = '';
  String mensajesumasC3 = '';

  int signo1 = 1;
  int signo2 = 1;

  void actualizarMensajes() {
    double fuerza12 =
        calcularFuerza(widget.carga1, widget.carga2, widget.distancia12);
    double fuerza13 =
        calcularFuerza(widget.carga1, widget.carga3, widget.distancia13);

    double fuerza12signo = fuerza12 * signo1;
    double fuerza13signo = fuerza13 * signo2;

    mensajeResultadoC1 =
        " Fuerza entre cargas 1 y 2: $fuerza12 N\n\n Fuerza entre cargas 1 y 3: $fuerza13 N";

    mensajesignoC1 =
        "Fuerza(1,2) = $fuerza12signo \n\nFuerza(1,3) = $fuerza13signo ";
    mensajesumasC1 = "$fuerza12signo + $fuerza13signo";

    double fuerzaresultanteC1 = Fresultante(fuerza12signo, fuerza13signo);

    mensajeFresultanteC1 = "Fuerza resultante: $fuerzaresultanteC1 N";
    ////////////////////////////////////////////

    double fuerza21 =
        calcularFuerza(widget.carga2, widget.carga1, widget.distancia12);
    double fuerza23 =
        calcularFuerza(widget.carga2, widget.carga3, widget.distancia23);

    double fuerza21signo = fuerza21 * signo1;
    double fuerza23signo = fuerza23 * signo2;

    mensajeResultadoC2 =
        " Fuerza entre cargas 2 y 1: $fuerza21 N\n\n Fuerza entre cargas 2 y 3: $fuerza23 N";

    mensajesignoC2 =
        "Fuerza(2,1) = $fuerza21signo\n\nFuerza(2,3) = $fuerza23signo ";

    mensajesumasC2 = "$fuerza21signo + $fuerza23signo";

    double fuerzaresultanteC2 = Fresultante(fuerza21signo, fuerza23signo);

    mensajeFresultanteC2 = "Fuerza resultante: $fuerzaresultanteC2";

    /////////////////////////////////////////////

    double fuerza31 =
        calcularFuerza(widget.carga3, widget.carga1, widget.distancia13);
    double fuerza32 =
        calcularFuerza(widget.carga3, widget.carga2, widget.distancia23);

    double fuerza31signo = fuerza31 * signo1;
    double fuerza32signo = fuerza32 * signo2;

    mensajeResultadoC3 =
        " Fuerza entre cargas 3 y 1: $fuerza31 N\n\n Fuerza entre cargas 3 y 2: $fuerza32 N";

    mensajesignoC3 =
        "Fuerza(3,1):  = $fuerza31signo\n\nFuerza(3,2): = $fuerza32signo ";
    mensajesumasC3 = "$fuerza31signo + $fuerza32signo";

    double fuerzaresultanteC3 = Fresultante(fuerza32signo, fuerza31signo);

    mensajeFresultanteC3 = "Fuerza resultante: $fuerzaresultanteC3";
  }

  double calcularFuerza(double q1, double q2, double r) {
    const k = 8990000000; // Constante de Coulomb en Nm²/C²
    q2 = q2.abs();
    q1 = q1.abs();
    return k * (q1 * q2) / pow(r, 2); // Fórmula de Coulomb
  }

  double Fresultante(double fuerza1, double fuerza2) {
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
                            elevation: WidgetStateProperty.all(10),
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.orange)),
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
                                  mensajesignoC2,
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
                                mensajeResultadoC1,
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
                                  " - Digite el sentido de la Fuerza (1 y 2)"),
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
                                  " - Digite el sentido de la Fuerza (1 y 3)"),
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
                            elevation: WidgetStateProperty.all(10),
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.orange)),
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
                                  mensajesignoC1,
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
                                  "Sumas:",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  mensajesumasC1,
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
                                mensajeFresultanteC1,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]))));
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
                                mensajeResultadoC3,
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
                                  " - Digite el sentido de la Fuerza (3 y 1)"),
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
                                  " - Digite el sentido de la Fuerza (3 y 2)"),
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
                            elevation: WidgetStateProperty.all(10),
                            backgroundColor:
                                const WidgetStatePropertyAll(Colors.orange)),
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
                                  mensajesignoC3,
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
                                  "Sumas:",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  mensajesumasC3,
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
                                mensajeFresultanteC3,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]))));
  }
}
