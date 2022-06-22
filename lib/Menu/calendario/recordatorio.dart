import 'dart:ui';

import 'package:flutter/material.dart';

class Recordatorio{
  final String titulo;
  final DateTime fecha;
  final DateTime hora;
  final String detalles;
  final Color backgroundColor;


  const Recordatorio ({
    required this.titulo,
    required this.fecha,
    required this.hora,
    required this.detalles,
     this.backgroundColor=Colors.tealAccent,
});
}