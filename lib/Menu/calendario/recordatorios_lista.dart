import 'package:flutter/cupertino.dart';
import 'package:safipet/Menu/calendario/recordatorio.dart';

class Recordatorios_lista extends ChangeNotifier{
  final List<Recordatorio> recordatorioslista=[];

  List <Recordatorio> get recordatorios=> recordatorioslista;

  DateTime _diaseleccionado=DateTime.now();

  DateTime get diaseleccionado=>_diaseleccionado;

  void setFecha(DateTime fecha) => _diaseleccionado=fecha;

  List<Recordatorio> get recordatoriosDiaSeleccionado=> recordatorioslista;

  void addRecordatorio(Recordatorio recordatorio){
    recordatorioslista.add(recordatorio);

    notifyListeners();
  }
}