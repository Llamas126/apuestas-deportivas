// Modelo para representar a un participante en el juego
class Participant {
  final String id;
  final String name;
  final String avatarPath; // ruta a assets o URL
  final String? role; // opcional, ej. "Jugador", "Invitado"

  Participant({
    required this.id,
    required this.name,
    required this.avatarPath,
    this.role,
  });

  // Helper para crear un avatar placeholder
  static Participant placeholder(String id) => Participant(
        id: id,
        name: 'Usuario',
        avatarPath: 'assets/images/avatar_placeholder.png',
      );

  @override
  String toString() => 'Participant(id: $id, name: $name)';
}
