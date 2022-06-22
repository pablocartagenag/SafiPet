import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safipet/Menu/calendario/recordatorio_vista.dart';
import 'package:safipet/Menu/calendario/recordatorios_config.dart';
import 'package:safipet/Menu/calendario/recordatorios_lista.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class Calendario extends StatefulWidget {
  const Calendario({Key? key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario>{


  @override
  Widget build(BuildContext context) {
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
    supportedLocales: [
    const Locale('es_ES '),
      Locale('es',''),
    ];
    Locale: const Locale('es_ES ');
    final recordatorios=Provider.of<Recordatorios_lista>(context).recordatorios;
    return Scaffold(
      body: SfCalendar(
        view: CalendarView.month,
        firstDayOfWeek: 1,
        initialSelectedDate: DateTime.now(),
        dataSource: RecordatoriosConfig(recordatorios),
        onLongPress: (detalles){
          final provider=Provider.of<Recordatorios_lista>(context, listen: false);

          provider.setFecha(detalles.date!);
          showModalBottomSheet(
              context: context,
              builder: (context) =>RecordatorioVista(),
          );
        },
      ),
    );
  }
}






