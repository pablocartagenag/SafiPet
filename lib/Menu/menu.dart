import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safipet/Menu/calendario/editar_recordatorios.dart';
import 'package:safipet/Menu/menucalendario.dart';
import 'package:safipet/Menu/menuclinicas.dart';
import 'package:safipet/Menu/menuinicio.dart';
import 'package:safipet/login.dart';


import 'cerrar_sesion.dart';

class Menu extends StatefulWidget{

  @override
  _MenuState createState() => _MenuState();

}

class _MenuState extends State<Menu>{

  int _indexactual=0;

  final pestanyas =[
    Menuinicio(),
    Menucalendario(),
    Menuclinicas(),
    const Center(child: Text('4')),
    Cerrar_sesion(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondologopeque.png'), fit: BoxFit.fill)),
        child: pestanyas[_indexactual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indexactual,
          showUnselectedLabels: true,
          iconSize: 22,
          unselectedFontSize: 10,
          selectedFontSize: 13,
          backgroundColor: Colors.teal,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Calendario',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_work_outlined),
              label: 'Clínicas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Opciones',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout),
              label: 'Cerrar sesión',
            ),
          ],
          onTap: (index){
            setState(() {
              _indexactual=index;
            });
          }
      ),
    );
  }

}