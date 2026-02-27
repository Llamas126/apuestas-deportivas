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
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: labels.asMap().entries.map((entry) {
          final idx = entry.key;
          final label = entry.value;
          final isActive = idx == activeIndex;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => onTabSelected?.call(idx),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isActive
                      ? kAccentYellow
                      : Color(0xFFC5D4B8).withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isActive ? Colors.black : Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
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
