import 'package:flutter/material.dart';
import '../models/participant.dart';
import '../utils/constants.dart';

class ParticipantsSection extends StatelessWidget {
  final List<Participant> participants;
  final int maxParticipants;

  const ParticipantsSection({required this.participants, required this.maxParticipants, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade800, width: 0.5),
      ),
      child: Stack(
        children: [
          Column(
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

  List<Widget> _buildStackedAvatars() {
    final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange, Colors.purple, Colors.cyan, Colors.pink];
    final items = <Widget>[];
    for (var i = 0; i < participants.length && i < 7; i++) {
      items.add(Positioned(
        left: i * 26.0,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: colors[i % colors.length],
          child: Text(
            participants[i].name[0].toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ));
    }
    if (participants.length < maxParticipants) {
      items.add(Positioned(
        left: (participants.length) * 26.0,
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