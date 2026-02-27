import 'package:flutter/material.dart';
import 'screens/event_detail_screen.dart';
import 'models/event.dart';
import 'models/participant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Event(
      id: 'e1',
      title: 'Fútbol 11vs11',
      date: DateTime(2024, 9, 30), // 30 de septiembre (se muestra como 31)
      startTime: TimeOfDay(hour: 17, minute: 0),
      endTime: TimeOfDay(hour: 19, minute: 0),
      location: 'Estadio Yappy Park (Sintetica)',
      cost: 5.00,
      modality: 'Equipos Aleatorios',
      gender: 'Masculino',
      minAge: 16,
      participants: [
        Participant(id: 'p1', name: 'Juan', avatarPath: 'assets/images/avatar1.jpg'),
        Participant(id: 'p2', name: 'Pedro', avatarPath: 'assets/images/avatar2.jpg'),
        Participant(id: 'p3', name: 'Carlos', avatarPath: 'assets/images/avatar3.jpg'),
        Participant(id: 'p4', name: 'Miguel', avatarPath: 'assets/images/avatar4.jpg'),
        Participant(id: 'p5', name: 'Antonio', avatarPath: 'assets/images/avatar5.jpg'),
        Participant(id: 'p6', name: 'Luis', avatarPath: 'assets/images/avatar6.jpg'),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventDetailScreen(event: event),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0E0E10),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
