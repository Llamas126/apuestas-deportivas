import 'package:flutter/material.dart';
import '../utils/constants.dart';

// Este widget muestra las pestañas para navegar entre las secciones del evento: Detalles,
// Cancha, Participantes y Reglas. Recibe el índice de la pestaña activa y una función
// para manejar la selección de pestañas. Las pestañas se muestran como botones
// con un fondo amarillo para la activa y gris para las inactivas.
class EventTabs extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int>? onTabSelected;
  final List<String> labels;

  const EventTabs({ // constante para optimizar la construcción del widget, ya que no tiene
    // estado interno y sus propiedades no cambian después de ser creadas.
    super.key,
    this.activeIndex = 0,
    this.onTabSelected,
    List<String>? labels,
  }) : labels = labels ?? const ['DETALLES', 'CANCHA', 'PARTICIPANTES', 'REGLAS']; // Si no se proporcionan etiquetas, se usan las predeterminadas.

  @override
  Widget build(BuildContext context) {
    // El Container principal tiene un ancho infinito para ocupar todo el
    // espacio horizontal disponible, y un padding para separar las pestañas de los bordes.
    // Dentro del Row, se generan las pestañas a partir de la lista de etiquetas, utilizando map
    // para crear un widget para cada una. Cada pestaña es un GestureDetector que detecta los taps y llama
    // a la función onTabSelected con el índice correspondiente. El estilo de cada pestaña cambia según
    // si es la activa o no, mostrando un fondo amarillo para la activa y gris con transparencia para las inactivas.
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
            child: GestureDetector( // Detecta los taps en cada pestaña para cambiar la sección activa.
              onTap: () => onTabSelected?.call(idx),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isActive
                    ? kAccentYellow
                    : Color(0xFFB8B8B8).withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text( //este text muestra la etiqueta de cada pestaña
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
        }).toList(), // Convierte el iterable de widgets en una lista para que pueda ser utilizada como hijos del Row.
      ),
    );
  }
}
