import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:safipet/Menu/calendario/editar_recordatorios.dart';
import 'package:safipet/Menu/calendario/recordatorios_lista.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendario/calendario.dart';


class Menucalendario extends StatefulWidget {
  const Menucalendario({Key? key}) : super(key: key);

  @override
  _MenucalendarioState createState() => _MenucalendarioState();
}

class _MenucalendarioState extends State<Menucalendario>{

  int _indexactual=0;

  final pestanyas =[
    Calendario(),
    EditarRecordatorios()
  ];

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context)=> Recordatorios_lista(),
    child: Scaffold(
      body: pestanyas[_indexactual],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.tealAccent,
        showUnselectedLabels: true,
        selectedItemColor: Colors.teal,
          items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined),
          label: 'Calendario',),
        BottomNavigationBarItem(
         icon: Icon(Icons.add_alarm_outlined),
         label: 'Recordatorio',),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_add),
          label: 'Recuerdo',),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Editar',),
      ], currentIndex: _indexactual,
          onTap: (index){
            setState(() {
              _indexactual=index;
            });
          }
    ),
    )
    );

}


