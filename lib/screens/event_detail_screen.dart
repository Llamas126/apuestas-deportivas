import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_header.dart';
import '../widgets/detail_section.dart';
import '../widgets/participants_section.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: EventHeader(title: event.title, location: event.location),
            ),
            SizedBox(height: 28), // Espacio para los tabs sobresalientes

            Container(
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ParticipantsSection(participants: event.participants, maxParticipants: 20),
            ),

            SizedBox(height: 24),
            Container(
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
                  Container(
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.sports_soccer_rounded, 'Eventos', true),
            _navItem(Icons.emoji_events, 'Torneos', false),
            _navItem(Icons.notifications_active_outlined, 'Novedades', false),
            _navItem(Icons.person_pin, 'Perfil', false),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? kAccentYellow : Colors.grey, size: 22),
        SizedBox(height: 4),
        Text(label, style: TextStyle(color: active ? kAccentYellow : Colors.grey, fontSize: 12))
      ],
    );
  }
}