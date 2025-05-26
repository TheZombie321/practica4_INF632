class JuegoAhorcado {
  final String palabraAdivinar;
  final List<String> letrasAdivinadas = [];
  int intentosRestantes = 6;
  bool juegoGanado = false;  
  bool juegoPerdido = false;

  JuegoAhorcado(this.palabraAdivinar);

  // Metodo para adivinar una letra
  void adivinarLetra(String letra) {
    if (letrasAdivinadas.contains(letra)) return;  
    
    letrasAdivinadas.add(letra);
    
    if (!palabraAdivinar.contains(letra)) {
      intentosRestantes--;
    }
    
    _verificarEstadoJuego();
  }

  // Verifica si el jugador gano o perdio
  void _verificarEstadoJuego() {
    // Verificar si gano 
    juegoGanado = palabraAdivinar.split('').every((char) => letrasAdivinadas.contains(char));
    
    // Verificar si perdio 
    juegoPerdido = intentosRestantes <= 0;
  }

  // Devuelve la palabra con las letras adivinadas y guiones bajos para las no adivinadas
  String obtenerPalabraMostrada() {
    return palabraAdivinar.split('').map((char) {
      return letrasAdivinadas.contains(char) ? char : '_';
    }).join(' ');
  }

  // Verifica si una letra ya fue adivinada
  bool fueLetraAdivinada(String letra) {
    return letrasAdivinadas.contains(letra);
  }
}