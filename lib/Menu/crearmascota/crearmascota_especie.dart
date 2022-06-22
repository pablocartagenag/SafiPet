
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'package:safipet/Menu/crearmascota/crearmascota_principales.dart';


class Crearmascota_especie extends StatefulWidget {
  const Crearmascota_especie({Key? key}) : super(key: key);

  @override
  _Crearmascota_especie createState() => _Crearmascota_especie();
}

class _Crearmascota_especie extends State<Crearmascota_especie>{

  List listaimagenes=["https://definicion.de/wp-content/uploads/2013/03/perro-1.jpg",
  "https://www.purina-latam.com/sites/g/files/auxxlc391/files/styles/social_share_large/public/01_%C2%BFQu%C3%A9-puedo-hacer-si-mi-gato-est%C3%A1-triste-.png?itok=w67Nhubc",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Oryctolagus_cuniculus_Tasmania_2.jpg/1200px-Oryctolagus_cuniculus_Tasmania_2.jpg",
  "https://www.petdarling.com/wp-content/uploads/2021/02/caracteristicas-del-huron.jpg",
  "https://dam.ngenespanol.com/wp-content/uploads/2020/12/colibries-2.jpg",
  "https://www.concienciaeco.com/wp-content/uploads/2016/05/serpiente-colores-1.jpg",
  "https://estaticos.muyinteresante.es/uploads/images/article/55ed7e643fafe8a89be690f5/ratones.jpg",
    "https://static.wikia.nocookie.net/reinoanimalia/images/7/79/Erizo_pigmeo_africano_9.png/revision/latest?cb=20150103151659&path-prefix=es",
    "https://www.pecesdeacuarios.net/wp-content/uploads/2018/11/PARTES-DE-UN-PEZ-CARPA-DORADA.jpg",
  "https://misanimales.com/wp-content/uploads/2018/12/domesticacion-del-cerdo.jpg",
  "https://i0.wp.com/hipertextual.com/wp-content/uploads/2021/11/aranas.jpg?fit=2400%2C1600&ssl=1",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Cochranella_spinosa.jpg/1200px-Cochranella_spinosa.jpg"];

  List listanombre=["Perro","Gato","Conejo","Hurón","Aves","Reptiles","Roedores","Erizo","Peces","Cerdos","Arañas","Ranas"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: ()=> Navigator.of(context).pop ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text('Selecciona una especie',),
      ),
      body:Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondobasico.png'), fit: BoxFit.fill)),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(12, (index) {
          return Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Ink.image(image: NetworkImage(listaimagenes[index]),
                  fit: BoxFit.cover,
                  child: InkWell(
                    onTap: () {Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftJoined,childCurrent: Crearmascota_especie(), child: Crearmascota_principales()));},
                  ),
                  ),
                  Text(listanombre[index], style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          );
        }),
      ),
    ),
    )
    );

      
      

  }
}