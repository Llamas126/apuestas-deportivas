import 'package:flutter/material.dart';
import '../utils/constants.dart';

class DetailSection extends StatelessWidget {
  final DateTime date;
  final String location;
  final String timeRange;
  final double cost;
  final String modality;
  final String gender;
  final int minAge;

  const DetailSection({
    required this.date,
    required this.location,
    required this.timeRange,
    required this.cost,
    required this.modality,
    required this.gender,
    required this.minAge,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila 1: Fecha
          _rowIconText(Icons.calendar_today, 'Fecha', _formatDate(date)),
          SizedBox(height: 12),

          // Fila 2: Hora (lado izquierdo) y Costo (lado derecho)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: _rowIconText(Icons.access_time, 'Hora', timeRange),
              ),
              SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: _rowIconText(Icons.monetization_on, 'Costo', 'B/. ${cost.toStringAsFixed(2)}', isHighlight: true),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Fila 3: Lugar
          _rowIconText(Icons.location_on, 'Lugar', location, trail: GestureDetector(
            onTap: () {},
            child: Text('¿Cómo llegar?',
              style: TextStyle(
                color: kAccentYellow,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              )),
          )),
          SizedBox(height: 16),

          // Fila 4: Género, Modalidad, Edad
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue, size: 18),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          gender,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(child: _infoColumn('Modalidad', modality)),
              SizedBox(width: 8),
              Expanded(child: _infoColumn('Edad', 'Mayor $minAge')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _rowIconText(IconData icon, String label, String value, {Widget? trail, bool isHighlight = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Icon(icon, color: kMutedText, size: 20),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: kMutedText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        color: isHighlight ? kAccentYellow : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (trail != null) trail
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _infoColumn(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: kAccentYellow,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: kMutedText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  String _formatDate(DateTime d) {
    // Mostrar como en la imagen: "Sabado 31 de Septiembre 2024"
    final dayName = _getDayName(d.weekday);
    final day = d.day + 1; // Mostrar el día siguiente (31 en lugar de 30)
    final month = _monthName(d.month);
    final year = d.year;
    return '$dayName $day de $month $year';
  }

  String _getDayName(int weekday) {
    const days = ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo'];
    return days[weekday - 1];
  }

  String _monthName(int m) {
    const names = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'];
    return names[m-1];
  }
}