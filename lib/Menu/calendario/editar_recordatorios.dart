import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:safipet/Menu/calendario/calendario.dart';
import 'package:safipet/Menu/calendario/recordatorio.dart';
import 'package:safipet/Menu/calendario/recordatorios_lista.dart';
import 'package:safipet/Menu/menu.dart';
import 'package:safipet/Menu/menucalendario.dart';

import 'package:safipet/recursos.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class EditarRecordatorios extends StatefulWidget {
  const EditarRecordatorios({Key? key, this.recordatorio}) : super(key: key);

  final Recordatorio? recordatorio;
  
  @override
  _EditarRecordatoriosState createState() => _EditarRecordatoriosState();
}

class _EditarRecordatoriosState extends State<EditarRecordatorios>{

  final claveformulario =GlobalKey<FormState>();
  final controladorTitulo =TextEditingController();
  late DateTime fechahoy;
  
  @override
  void initState(){
    super.initState();

    if(widget.recordatorio==null){
      fechahoy=DateTime.now();
    }
  }

  @override
  void dispose(){
    controladorTitulo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:700,
        width: 700,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondologopeque.png'), fit: BoxFit.fill)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: claveformulario,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 120,),
              Titulorecordatorio(),
              const SizedBox(height: 12),
              elegirFecha(),
              ElevatedButton(
                onPressed: guardarRecordatorio,
                child: const Text('Guardar'),
                style: ElevatedButton.styleFrom(primary: Colors.teal),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }

  List<Widget> buildGuardarRecordatorio() =>[
    ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.done),
        label: const Text('Guardar'),
        style: ElevatedButton.styleFrom(primary: Colors.transparent, shadowColor:Colors.transparent ),
    ),
  ];

  Widget Titulorecordatorio()=>TextFormField(
    style: const TextStyle(fontSize: 24),
    decoration: const InputDecoration(border: UnderlineInputBorder(), hintText: '¿Para qué es el recordatorio?'
    ),
    onFieldSubmitted: (_) =>guardarRecordatorio(),
    validator: (titulo)=>
      titulo!= null && titulo.isEmpty ? 'El título del recordatorio no puede estar vacío' : null,
    controller: controladorTitulo,
  );

  Widget elegirFecha()=>Column(
    children: [
  Row(
  children: [
  Expanded(
  flex: 2,
    child: DropdownFecha(
      text: Recursos.aFecha(fechahoy), onClicked: () => elegirDeCalendario( elegirFecha: true),
    ),
  ),
  Expanded(child: DropdownFecha(
  text: Recursos.aHora(fechahoy), onClicked: () => elegirDeCalendario(elegirFecha: false) ))
  ],
  ),
    ],
  );

  Widget DropdownFecha({
  required String text,
  required VoidCallback onClicked,
})=>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Future elegirDeCalendario({required bool elegirFecha}) async {
    final fecha= await elegirFechayHora(fechahoy, elegirFecha: elegirFecha);
    if(fecha==null) return;

    setState(()=> fechahoy=fecha);
  }

  Future<DateTime?> elegirFechayHora(
      DateTime fechaInicial, {
        required bool elegirFecha,
        DateTime? primeraFecha,
})async{
  if(elegirFecha){
    final fecha= await showDatePicker(
      context: context,
      initialDate: fechaInicial,
      lastDate: DateTime(2100),
      firstDate: primeraFecha ?? DateTime(2021, 1),
    );

    if(fecha==null) return null;

    final hora= Duration(hours: fechaInicial.hour, minutes: fechaInicial.minute);

    return fecha.add(hora);
  } else {
    final elegirHora =await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(fechaInicial),
    );

    if(elegirHora==null) return null;

    final fecha = DateTime(fechaInicial.year, fechaInicial.month, fechaInicial.day);
    final hora= Duration(hours: elegirHora.hour, minutes: elegirHora.minute);
    return fecha.add(hora);
  }
  }

  Future guardarRecordatorio() async{
    final esValido =claveformulario.currentState!.validate();

    if(esValido){
      final recordatorio=Recordatorio(
          titulo: controladorTitulo.text,
          detalles: 'Detalles',
          fecha: fechahoy,
          hora: fechahoy,
      );
      final provider=Provider.of<Recordatorios_lista>(context, listen: false);
      provider.addRecordatorio(recordatorio);

      Navigator.push(context, MaterialPageRoute(builder: (context)=> Menu()));
    }
  }
}
