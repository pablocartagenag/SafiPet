import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/animal.dart';
import '../db/animales_db.dart';

class MascotaDetalles extends StatefulWidget {

  int i;

  MascotaDetalles(this.i);

  @override
  _MascotaDetallesState createState() => _MascotaDetallesState();
}


class _MascotaDetallesState extends State<MascotaDetalles> {


  List<Mascota> mascotas=[];//aqui voy a guardar todas las mascotas de la BD

  @override
  void initState(){
    cargaMascotas();
    super.initState();
  }

  cargaMascotas() async{
    List<Mascota> auxMascota= await AnimalesBD.mascotas();//recojo todas las mascotas registradas y las meto en una lista temporal para asignar el listado

    setState((){
      mascotas=auxMascota;
    });
  }

  @override
  Widget build(BuildContext context) {

    int j=widget.i;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: 700,
        width: 700,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondologopeque.png'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 120,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(mascotas[j].nombre, textAlign: TextAlign.center, style: TextStyle(fontSize: 35),),
              ],
            ),
            SizedBox(height: 20,),
            Text('Especie: '+mascotas[j].especie, textAlign: TextAlign.left, style: TextStyle(fontSize: 22),),
            Text('Raza: '+mascotas[j].raza, textAlign: TextAlign.left, style: TextStyle(fontSize: 22),),
            Text('Sexo: '+mascotas[j].sexo, textAlign: TextAlign.left, style: TextStyle(fontSize: 22),),
            Text('Color: '+mascotas[j].color, textAlign: TextAlign.left, style: TextStyle(fontSize: 22),),
            Text('Vacunas: '+mascotas[j].vacunas, textAlign: TextAlign.left, style: TextStyle(fontSize: 22),),
            Text('Medicaciones: '+mascotas[j].medicaciones, textAlign: TextAlign.left, style: TextStyle(fontSize: 22),),
            Text('Esterilizado: '+mascotas[j].esterilizado, textAlign: TextAlign.left, style: TextStyle(fontSize: 22),),
          ],
        ),
      ),
    );
  }
}
