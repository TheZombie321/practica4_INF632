import 'package:flutter/material.dart';

//teclado virtual para adivinar letras
class Teclado extends StatelessWidget {
  final Function(String) alPresionarLetra;
  final List<String> letrasAdivinadas;

  final bool juegoTerminado;
  
  const Teclado({
    required this.alPresionarLetra,
    required this.letrasAdivinadas,

    required this.juegoTerminado,
  
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> letras = [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
      'K', 'L', 'M', 'N', 'Ñ', 'O', 'P', 'Q', 'R', 'S',
      'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    ];
    
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: letras.map((letra) {
        final yaAdivinada = letrasAdivinadas.contains(letra);
        return ElevatedButton(
          onPressed: juegoTerminado || yaAdivinada
              ? null
              : () => alPresionarLetra(letra),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(48, 48),
          ),
        child: Text(letra),
        );
      }).toList(),
    );
  }
}