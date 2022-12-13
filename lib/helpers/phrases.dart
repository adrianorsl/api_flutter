import 'dart:math';

/// Cria uma frase aleatória
String getRandomPhrase() {
  List<String> phrases = [
    "Hoje estou feliz pois fez Sol",
    "Não estou tão bem, o calor está insuportável",
    "Hoje terei que trabalhar.",
    "Hoje e meu dia de folga!"
  ];

  Random rng = Random();
  return phrases[rng.nextInt(phrases.length - 1)];
}
