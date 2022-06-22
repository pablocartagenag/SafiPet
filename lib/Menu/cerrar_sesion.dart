
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';

import '../login.dart';
import 'crearmascota/crearmascota_especie.dart';
import 'menu.dart';



class Cerrar_sesion extends StatefulWidget {
  const Cerrar_sesion({Key? key}) : super(key: key);

  @override
  _Cerrar_sesion createState() => _Cerrar_sesion();
}

late String vacunas, medicaciones;


class _Cerrar_sesion extends State<Cerrar_sesion> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondologopeque.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              width: 275,
              decoration: BoxDecoration(color: Colors.teal, border: Border.all(width: 1,color: Colors.teal),borderRadius: BorderRadius.circular(12)),
              child: Card(
                color: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Text('¿Quieres cerrar sesión?',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 25,),)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => FirebaseAuth.instance.signOut(), child: Text('SI', style: TextStyle(fontSize: 20)), style: ElevatedButton.styleFrom(primary: Colors.red,
                fixedSize: Size(100, 40))),
                SizedBox(width: 50),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Menu())); }
                    , child: Text('NO', style: TextStyle(fontSize: 20)), style: ElevatedButton.styleFrom(primary: Colors.green, fixedSize: Size(100, 40))),
              ],
            )
          ],
        ),
      ),
    );
  }
}