import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safipet/Menu/calendario/recordatorios_config.dart';
import 'package:safipet/Menu/calendario/recordatorios_lista.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class RecordatorioVista extends StatefulWidget{
  @override
  _RecordatorioVistaState createState()=>_RecordatorioVistaState();
}

class _RecordatorioVistaState extends State<RecordatorioVista>{
  @override
  Widget build(BuildContext context){
    final provider=Provider.of<Recordatorios_lista>(context);
    final recordatoriosseleccionados= provider.recordatoriosDiaSeleccionado;


    if(recordatoriosseleccionados.isEmpty){
      return const Center(
        child: Text('No hay recordatorios', style: TextStyle(color: Colors.black, fontSize: 23),),
      );
    }

    return SfCalendar(
      view: CalendarView.timelineDay,
      dataSource:RecordatoriosConfig(provider.recordatorios),
    );
  }
}