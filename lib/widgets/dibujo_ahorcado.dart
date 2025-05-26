import 'package:flutter/material.dart';

// Widget que muestra el dibujo del ahorcado según los intentos restantes
class DibujoAhorcado extends StatelessWidget {
  final int intentosRestantes;
  
  const DibujoAhorcado({
    required this.intentosRestantes,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: PintorAhorcado(intentosRestantes: intentosRestantes),
    );
  }
}

// Clase que dibuja las partes del ahorcado
class PintorAhorcado extends CustomPainter {
  final int intentosRestantes;
  
  PintorAhorcado({required this.intentosRestantes});
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    
    // Dibujar la base de la horca
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.8),
      Offset(size.width * 0.8, size.height * 0.8),
      paint,
    );
    
    // Poste vertical
    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.8),
      Offset(size.width * 0.3, size.height * 0.2),
      paint,
    );
    
    // Travesaño superior
    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.2),
      Offset(size.width * 0.6, size.height * 0.2),
      paint,
    );
    
    // Cuerda
    canvas.drawLine(
      Offset(size.width * 0.6, size.height * 0.2),
      Offset(size.width * 0.6, size.height * 0.3),
      paint,
    );
    
    // Dibujar partes del personaje según los intentos fallidos
    if (intentosRestantes < 6) {
      // Cabeza
      canvas.drawCircle(
        Offset(size.width * 0.6, size.height * 0.4),
        10,
        paint,
      );
    }
    
    if (intentosRestantes < 5) {
      // Cuerpo
      canvas.drawLine(
        Offset(size.width * 0.6, size.height * 0.4 + 20),
        Offset(size.width * 0.6, size.height * 0.4 + 60),
        paint,
      );
    }
    
    if (intentosRestantes < 4) {
      // Brazo izquierdo
      canvas.drawLine(
        Offset(size.width * 0.6, size.height * 0.4 + 30),
        Offset(size.width * 0.5, size.height * 0.4 + 40),
        paint,
      );
    }
    
    if (intentosRestantes < 3) {
      // Brazo derecho
      canvas.drawLine(
        Offset(size.width * 0.6, size.height * 0.4 + 30),
        Offset(size.width * 0.7, size.height * 0.4 + 40),
        paint,
      );
    }
    
    if (intentosRestantes < 2) {
      // Pierna izquierda
      canvas.drawLine(
        Offset(size.width * 0.6, size.height * 0.4 + 60),
        Offset(size.width * 0.5, size.height * 0.4 + 80),
        paint,
      );
    }
    
    if (intentosRestantes < 1) {
      // Pierna derecha
      canvas.drawLine(
        Offset(size.width * 0.6, size.height * 0.4 + 60),
        Offset(size.width * 0.7, size.height * 0.4 + 80),
        paint,
      );
    }
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}