import 'package:flutter/material.dart';

// Widget que muestra la palabra a adivinar con guiones para las letras desconocidas
class MostrarPalabra extends StatelessWidget {
  final String palabraMostrada;
  
  const MostrarPalabra({
    required this.palabraMostrada,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          palabraMostrada,
          style: const TextStyle(
            fontSize: 24,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }
}