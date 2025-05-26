import 'package:flutter/material.dart';
import 'screens/pantalla_ahorcado.dart';

void main() {
  runApp(const MyApp());
}

// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego del Ahorcado',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PantallaAhorcado(),
      debugShowCheckedModeBanner: false,
    );
  }
}