import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_header.dart';
import '../widgets/detail_section.dart';
import '../widgets/participants_section.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';

// Esta pantalla muestra los detalles completos de un evento deportivo, incluyendo su título,
// ubicación, fecha, hora, costo, modalidad, género, edad mínima y la lista de participantes.
// También incluye un botón para participar en el evento y una barra de navegación inferior
// para acceder a otras secciones de la aplicación.
class EventDetailScreen extends StatelessWidget {
  final Event event;

  //utilizo key para permitir que el widget sea identificado de
  // manera única en el árbol de widgets, lo que es útil para optimizaciones
  // y para evitar problemas al actualizar la interfaz de usuario.
  // Es una buena práctica incluirlo en los widgets personalizados,
  // especialmente si se espera que puedan ser reutilizados o actualizados dinámicamente.
  const EventDetailScreen({required this.event, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final timeRange = '${event.startTime.format(context)} - ${event.endTime.format(context)}';
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: null,
        leading: null,
        centerTitle: false,
      ),
      body: SingleChildScrollView( // Permite que el contenido sea desplazable si no cabe en la pantalla
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: EventHeader(title: event.title, location: event.location),
            ),
            SizedBox(height: 28), // Espacio para los tabs sobresalientes

            Container( // Detalles del evento
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DetailSection(
                date: event.date,
                location: event.location,
                timeRange: timeRange,
                cost: event.cost,
                modality: event.modality,
                gender: event.gender,
                minAge: event.minAge,
              ),
            ),

            SizedBox(height: 24),
            Container( // Sección de participantes
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ParticipantsSection(participants: event.participants, maxParticipants: 20),
            ),

            SizedBox(height: 24),
            Container( // Botón de participar
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'PARTICIPAR',
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('¡Participando en el evento!'))
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 12),
                  Container( // Botón de enviar mensaje
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  )
                ],
              ),
            ),

            SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: Container( // Barra de navegación inferior
        padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: Offset(0, -4), // Sombra para dar profundidad a la barra de navegación
            ),
          ],
        ),
        child: SafeArea( // SafeArea para evitar que los íconos de navegación se superpongan
          // con las áreas de la pantalla que pueden ser difíciles de alcanzar o que pueden interferir
          // con la interacción del usuario, como el área de gestos en dispositivos sin botones físicos.
          top: false,
          child: Row( // Íconos de navegación
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.sports_soccer_rounded, 'Eventos', true),
              _navItem(Icons.emoji_events, 'Torneos', false),
              _navItem(Icons.notifications_active_outlined, 'Novedades', false),
              _navItem(Icons.person_pin, 'Perfil', false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column( // Cada ítem de navegación es una columna con un ícono y un texto
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? kAccentYellow : Colors.grey, size: 22),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: active ? kAccentYellow : Colors.grey, fontSize: 12))
      ],
    );
  }
}