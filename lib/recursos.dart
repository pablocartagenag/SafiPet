import 'package:intl/intl.dart';

class Recursos {
  static String aFecha(DateTime fecha){
    final hoy =DateFormat.yMMMd().format(fecha);
    return hoy;
  }

  static String aHora(DateTime fecha){
    final hora=DateFormat.Hm().format(fecha);
    return hora;
  }
}