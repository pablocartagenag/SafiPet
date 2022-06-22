import 'dart:ffi';

class Mascota {
  final int id;
  final String especie;
  late final String nombre;
  late final String raza;
  late final String sexo;
  late final int? peso;
  late final String color;
  final String vacunas;
  final String medicaciones;
  final String esterilizado;
  final int microchip;

  Mascota(
      {required this.id,
      required this.especie,
      required this.nombre,
      required this.raza,
      required this.sexo,
      required this.peso,
      required this.color,
      required this.vacunas,
      required this.medicaciones,
      required this.esterilizado,
      required this.microchip});

  Map<String, dynamic> toMaps() {
    return {
      'id': id,
      'especie': especie,
      'nombre': nombre,
      'raza': raza,
      'sexo': sexo,
      'peso': peso,
      'color': color,
      'vacunas': vacunas,
      'medicaciones': medicaciones,
      'esterilizado': esterilizado,
      'microchip': microchip,
    };
  }
}
