import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  // Este widget es un botón personalizado con un diseño moderno y atractivo.
  // Se utiliza en la pantalla de detalles del evento para permitir a los usuarios
  // unirse al evento o realizar alguna acción relacionada. El botón tiene un degradado de
  // colores, una sombra sutil y un ícono de "play" para hacerlo más llamativo. Al presionar
  // el botón, se ejecuta la función proporcionada en el parámetro onPressed.

  const CustomButton({required this.label, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // El Material y el InkWell se utilizan para crear un efecto de "ripple"
    // al presionar el botón, lo que mejora la experiencia del usuario al proporcionar retroalimentación visual.
    // El Ink se encarga de dibujar el fondo con el degradado y la sombra, mientras que el Row organiza el ícono
    // y el texto dentro del botón.
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(40),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFD54A), kAccentYellow],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 4))],
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row( // Organiza el ícono y el texto en una fila
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_arrow, color: Colors.black, size: 20),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle( // Estilo del texto del botón
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}