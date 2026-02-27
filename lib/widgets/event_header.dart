import 'package:flutter/material.dart';
import 'dart:ui';
import 'event_tabs.dart';

class EventHeader extends StatelessWidget {
  final String title;
  final String location;

  const EventHeader({required this.title, this.location = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Imagen de fondo del header
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration( // Estilo del contenedor principal del header
            color: Color(0xfffdc300).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow( // Sombra suave para darle profundidad al header
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
            image: DecorationImage( // Imagen de fondo con un filtro de desenfoque para mejorar la legibilidad del texto
              image: AssetImage('assets/images/stadium.jpg'),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {
                debugPrint('Error loading image: $exception');
              },
            ),
          ),
          child: BackdropFilter( // Aplica un filtro de desenfoque a la imagen de fondo para mejorar la legibilidad del texto y los elementos superpuestos.
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(  //contenedor interno para el degradado oscuro y los elementos del header
              padding: EdgeInsets.fromLTRB(16, 12, 16, 70),
              decoration: BoxDecoration( //esto es para el degradado oscuro del header
                borderRadius: BorderRadius.circular(40),
                gradient: LinearGradient( // degradado oscuro que va de transparente
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.black.withValues(alpha: 0.3),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Flecha hacia atrás en la esquina superior izquierda
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container( //
                      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
                      decoration: BoxDecoration( // Estilo del botón de retroceso con un fondo semitransparente y bordes redondeados
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                          width: 0.5,
                        ),
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.white, size: 18),
                    ),
                  ),
                  // Badge MESTRES en la parte superior derecha
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container( //contenedor de ''Mestres''
                      padding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.2),
                          width: 0.5,
                        ),
                      ),
                      child: Text( //texto de Mestres
                        'MESTRES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                  // Título y localización centrados
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text( // Titulo del evento
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 6),
                        Row( // Localización del evento con ícono de estadio
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.stadium_outlined, color: Colors.white70, size: 14),
                            SizedBox(width: 2),
                            Text( // Texto de localización
                              location,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Tabs posicionados al fondo del header, sobresaliendo un poco
        Positioned(
          left: 16,
          right: 16,
          bottom: 20,
          child: EventTabs(activeIndex: 0),
        ) //decidi colocar los tabs dentro del stack del header para que se superpongan
        // un poco al fondo del header, dando un efecto de integración entre el header y los tabs
      ],
    );
  }
}
