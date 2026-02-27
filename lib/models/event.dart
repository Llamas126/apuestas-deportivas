import 'package:flutter/material.dart';

import 'participant.dart';
// se creo esta clase para representar un evento deportivo, con sus detalles y
// la lista de participantes. Es el modelo principal que se usará en la aplicación
// para mostrar la información del evento en la pantalla de detalles.
class Event {
  final String id;
  final String title;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String location;
  final double cost;
  final String modality;
  final String gender; // "Masculino" ...
  final int minAge;
  final List<Participant> participants;

  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.cost,
    required this.modality,
    required this.gender,
    required this.minAge,
    required this.participants,
  });
}