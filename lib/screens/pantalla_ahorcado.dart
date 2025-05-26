import 'package:flutter/material.dart';
import '../models/modelo_ahorcado.dart';
import '../widgets/dibujo_ahorcado.dart';
import '../widgets/teclado.dart';
import '../widgets/mostrar_palabra.dart';

// Pantalla principal del juego del ahorcado
class PantallaAhorcado extends StatefulWidget {
  const PantallaAhorcado({super.key});

  @override
  State<PantallaAhorcado> createState() => _EstadoPantallaAhorcado();
}

class _EstadoPantallaAhorcado extends State<PantallaAhorcado> {
  late JuegoAhorcado juego;
  final List<String> listaPalabras = [
    'FLUTTER', 'DART', 'WIDGET', 'AHORCADO', 
    'PROGRAMACION', 'MOVIL', 'DESARROLLO'
  ];

  @override
  void initState() {
    super.initState();
    _iniciarNuevoJuego();
  }

  // Inicia un nuevo juego con una palabra aleatoria
  void _iniciarNuevoJuego() {
    final palabraAleatoria = listaPalabras..shuffle();
    setState(() {
      juego = JuegoAhorcado(palabraAleatoria.first);
    });
  }

  // Maneja el evento cuando se presiona una letra
  void _manejarLetraPresionada(String letra) {
    if (juego.juegoGanado || juego.juegoPerdido) return;
    
    setState(() {
      juego.adivinarLetra(letra);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego del Ahorcado'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _iniciarNuevoJuego,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Dibujo del ahorcado
            DibujoAhorcado(intentosRestantes: juego.intentosRestantes),
            
            // Palabra a adivinar
            MostrarPalabra(palabraMostrada: juego.obtenerPalabraMostrada()),
            
            // Teclado
            Teclado(
              alPresionarLetra: _manejarLetraPresionada,
              letrasAdivinadas: juego.letrasAdivinadas,
              juegoTerminado: juego.juegoGanado || juego.juegoPerdido,
            ),
            
            // Mensajes de resultado
            if (juego.juegoGanado)
              const Text(
                '¡Ganaste!',
                style: TextStyle(color: Colors.green, fontSize: 24),
              ),
            if (juego.juegoPerdido)
              Text(
                'Perdiste. La palabra era: ${juego.palabraAdivinar}',
                style: const TextStyle(color: Colors.red, fontSize: 24),
              ),
            
            // Contador de intentos
            Text(
              'Intentos restantes: ${juego.intentosRestantes}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}