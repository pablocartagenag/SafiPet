import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:safipet/Menu/crearmascota/crearmascota_medico.dart';
import 'package:safipet/Menu/menu.dart';
import 'package:safipet/Menu/menuinicio.dart';

class PreguntaDatos extends StatefulWidget {
  const PreguntaDatos({Key? key}) : super(key: key);

  @override
  _PreguntaDatosState createState() => _PreguntaDatosState();
}

class _PreguntaDatosState extends State<PreguntaDatos> {
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
                    Text('¿Quieres introducir los datos médicos o dejarlo para otro momento?',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20,),)
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
                ElevatedButton(onPressed: () { Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftJoined,childCurrent: PreguntaDatos(), child: Crearmascota_medico()));}
                    , child: Text('Seguir' ,style: TextStyle(fontSize: 17), textAlign: TextAlign.center), style: ElevatedButton.styleFrom(primary: Colors.teal,
                    fixedSize: Size(110, 50))),
                SizedBox(width: 50),
                ElevatedButton(onPressed: ()  {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Menu()));},
                     child: Text('Otro momento', style: TextStyle(fontSize: 17),textAlign: TextAlign.center), style: ElevatedButton.styleFrom(primary: Colors.teal, fixedSize: Size(110, 50))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
