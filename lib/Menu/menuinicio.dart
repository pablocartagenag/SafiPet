import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:safipet/Menu/mascota_detalles.dart';
import 'package:safipet/db/animales_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../db/animal.dart';
import 'crearmascota/crearmascota_principales.dart';
import 'menu.dart';


class Menuinicio extends StatefulWidget {
  const Menuinicio({Key? key}) : super(key: key);

  @override
  _MenuinicioState createState() => _MenuinicioState();
}

class _MenuinicioState extends State<Menuinicio>{


  @override
  Widget build(BuildContext context) {


    AnimalesBD.mascotas();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondologopeque.png'), fit: BoxFit.fill)),
        child: Column(
      children: [
        SizedBox(
          height: 95,
        ),
        Container(
          height: 500,
          width: 400,
          child: ListaMascotas(),
        ),
        /*ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Card(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Image(
                            image: NetworkImage(
                                'https://pbs.twimg.com/profile_images/1320162910522454016/FB3LdcG9_400x400.jpg'),
                            height: 125,
                            width: 125,
                          ),
                        ),
                      ),
                      Column(
                        children: const [
                          Text('Buddy'),
                          Text('Border collie'),
                          Text('4'),
                        ],
                      )
                    ],
                ),
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Colors.white,
            child: Column(
              children: const [
                ListTile(
                  leading: Image(
                    height: 75,
                    width: 75,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://i.pinimg.com/originals/36/83/9b/36839b3b2a74eb80078eba7d8f700536.jpg'),
                  ),
                  title: Text('Marta contable'),
                  subtitle: Text('Contable de empresa'),
                ),
              ],
            ),
          ),
        ],
      ),*/
        Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(onPressed: () {
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Crearmascota_principales()));},
            style: ElevatedButton.styleFrom(primary: Colors.teal, fixedSize: Size(150, 50)),
            child: const Text('Añadir mascota'),),
        )


      ],
      ),
      ),
    );
  }
  }

  class ListaMascotas extends StatefulWidget{

  @override
    _MiListaMascotas createState()=>_MiListaMascotas();
  }

  class _MiListaMascotas extends State<ListaMascotas>{

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
    return ListView.builder(
      itemCount: mascotas.length,
      itemBuilder: (context, i)=>
        Dismissible(key: Key(i.toString()),
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,
            padding: EdgeInsets.only(left: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.delete, color: Colors.red,),
              ),
          ),
          onDismissed: (direction){
            AnimalesBD.delete(mascotas[i]);
          },
          child:
          ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage('imagenes/fondoynombre.png'),),
            tileColor: Colors.teal,
            shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 5), borderRadius: BorderRadius.circular(10)),
            title: Text(mascotas[i].nombre, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            subtitle: Text(mascotas[i].raza, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.arrow_forward, color: Colors.black, size: 50,), onTap: () {
              Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: MascotaDetalles(i)));},
          ),
        )
      ,
    );

  }

  }





