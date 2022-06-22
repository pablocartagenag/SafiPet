
import 'dart:ui';
import 'package:safipet/Menu/calendario/recordatorio.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class RecordatoriosConfig extends CalendarDataSource {
  RecordatoriosConfig(List<Recordatorio> appointments) {
    this.appointments = appointments;
  }

  Recordatorio getRecordatorio(int index) =>
      appointments![index] as Recordatorio;

  @override
  DateTime getFecha(int index) => getRecordatorio(index).fecha;

  @override
  DateTime getHora(int index) => getRecordatorio(index).hora;

  @override
  String getTitulo(int index) => getRecordatorio(index).titulo;

  @override
  String getDetalles(int index) => getRecordatorio(index).detalles;

  @override
  Color getColor(int index) => getRecordatorio(index).backgroundColor;
}