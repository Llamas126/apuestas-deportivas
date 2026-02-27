import 'package:flutter/material.dart';
import '../utils/constants.dart';

class EventTabs extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int>? onTabSelected;
  final List<String> labels;

  const EventTabs({
    super.key,
    this.activeIndex = 0,
    this.onTabSelected,
    List<String>? labels,
  }) : labels = labels ?? const ['DETALLES', 'CANCHA', 'PARTICIPANTES', 'REGLAS'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: labels.asMap().entries.map((entry) {
          final idx = entry.key;
          final label = entry.value;
          final isActive = idx == activeIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected?.call(idx),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isActive
                    ? kAccentYellow
                    : Color(0xFFB8B8B8).withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
