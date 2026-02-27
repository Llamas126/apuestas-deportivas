import 'package:flutter/material.dart';
import '../models/participant.dart';
import '../utils/constants.dart';
// Este widget muestra la sección de participantes en la pantalla de detalles del evento,
// incluyendo los avatares apilados de los participantes y un contador que indica cuántos
// participantes hay en comparación con el máximo permitido.
// Si el número de participantes es menor que el máximo
class ParticipantsSection extends StatelessWidget {
  final List<Participant> participants;
  final int maxParticipants;

// El constructor recibe la lista de participantes y el número máximo de participantes permitidos, lo que permite mostrar la información de manera dinámica en función de los datos proporcionados.
  const ParticipantsSection({required this.participants, required this.maxParticipants, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) { // El Container principal tiene un fondo oscuro,
    // bordes redondeados y un borde sutil para darle un aspecto moderno.
    // Dentro del Container, se utiliza un Stack para superponer los avatares de los
    // participantes y el contador en la esquina superior derecha. La función _buildStackedAvatars() se
    // encarga de crear los avatares apilados, limitando el número de avatares mostrados a 7 y
    // agregando un ícono de "add" si hay espacio para más participantes.
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade800, width: 0.5),
      ),
      child: Stack(
        children: [
          Column( // Organiza el título y los avatares en una columna con espacio entre ellos
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Participantes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
              SizedBox(height: 12),
              SizedBox(
                height: 40,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: _buildStackedAvatars(),
                ),
              )
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${participants.length}/$maxParticipants',
                style: TextStyle(
                  color: Color(0xFFB7B7B7),
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildStackedAvatars() { // Esta función genera una lista de widgets
    // que representan los avatares apilados de los participantes.
    // Se limita a mostrar un máximo de 7 avatares para evitar
    // que se superpongan demasiado, y se asignan colores diferentes a cada avatar
    // para diferenciarlos visualmente. Si el número de participantes
    // es menor que el máximo permitido, se agrega un ícono de "add" al final para indicar
    // que aún hay espacio para más participantes.
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple, Colors.cyan, Colors.pink];
    final items = <Widget>[];
    for (var i = 0; i < participants.length && i < 7; i++) { // Limita a mostrar un máximo de 7 avatares
      items.add(Positioned(
        left: i * 26.0,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: colors[i % colors.length],
          child: Text(
            participants[i].name[0].toUpperCase(), // Muestra la primera letra del nombre del participante en el avatar
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ));
    }
    if (participants.length < maxParticipants) { // Si hay espacio para más participantes, agrega un ícono de "add" al final
      items.add(Positioned(
        left: (participants.length) * 26.0, // Posiciona el ícono de "add" después del último avatar mostrado
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.shade700,
          child: Icon(Icons.add, color: Colors.white, size: 16),
        ),
      ));
    }
    return items;
  }
}