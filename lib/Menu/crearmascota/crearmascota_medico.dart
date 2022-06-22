
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';

import '../../db/animal.dart';
import '../../db/animales_db.dart';
import '../menu.dart';
import 'crearmascota_principales.dart';


class Crearmascota_medico extends StatefulWidget {
  const Crearmascota_medico({Key? key}) : super(key: key);

  @override
  _Crearmascota_medico createState() => _Crearmascota_medico();
}

late String vacunas, medicaciones;
late int microchip;

String? esteril;

class CheckBoxEstado{
  final String title;
  bool valor;

  CheckBoxEstado({
    required this.title,
    this.valor=false,
});
}



class _Crearmascota_medico extends State<Crearmascota_medico>{

bool valor=false;

  final vacunasController= TextEditingController();
  final medicacionesController= TextEditingController();
  final microchipController= TextEditingController();
  final esterilController= TextEditingController();

  Widget buildCheckBox()=> CheckboxListTile(
  title: const Text("Rabia"),
  controlAffinity: ListTileControlAffinity.leading,
  value: valor,
  onChanged: (_valor) {
    setState(() {
      valor = _valor!;
    });
  },
);

  Widget buildVacunas(){
    return TextFormField(
      controller: vacunasController,
      decoration: const InputDecoration(labelText: '¿Qué vacunas tiene el animal?'),
      keyboardType: TextInputType.text,
      onSaved: (valor) {
        vacunas=valor!;
      },
    );
}

  Widget buildMedicaciones(){
    return TextFormField(
      controller: medicacionesController,
      decoration: const InputDecoration(labelText: '¿Qué medicaciones requiere?'),
      keyboardType: TextInputType.text,
      onSaved: (valor) {
        medicaciones=valor!;
      },
    );
}

Widget buildMicrochip(){
  return TextFormField(
    controller: microchipController,
    decoration: const InputDecoration(labelText: 'Introduce el microchip'),
    keyboardType: TextInputType.number,
    onSaved: (valor) {
      microchip=valor! as int;
    },
  );
}

Widget buildEsteril(){
  return TextFormField(
    controller: esterilController,
    decoration: const InputDecoration(labelText: '¿Es estéril?'),
    keyboardType: TextInputType.text,
    onSaved: (valor) {
      esteril=valor!;
    },
  );
}

  /*Widget buildEsteril(){
    return Container(
      decoration: const BoxDecoration(
      ),
      child: DropdownButton<String>(
      alignment: Alignment.center,
      isExpanded: true,
      value: esteril,
      hint: const Text("Estado"),
      underline: Container(
        height: 1,
        color: Colors.black,
      ),
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (String? newValor) {
        setState(() {
          esteril = newValor ?? "";
        });
      },
      items: <String>['Fertil', 'Vasectomia','Orquidectomia']
          .map<DropdownMenuItem<String>>((String valor) {
        return DropdownMenuItem<String>(
          value: valor,
          child: Text(valor),
        );
      }).toList(),
      ),
    );
}*/

/*Widget buildPeso() {
    return TextFormField(
      controller: pesoController,
      decoration: const InputDecoration(labelText: 'Peso'),
      keyboardType: TextInputType.number,
      validator: (valor) {
        int? peso = int.tryParse(valor!);

        if (peso == null || peso <= 0) {
          return 'Introduce un peso válido';
        }
      },
      onSaved: (valor) {
        peso = valor!;
      },
    );
  }*/



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondobasico.png'), fit: BoxFit.fill)),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 75,
                width: 250,
                decoration: BoxDecoration(color: Colors.teal, border: Border.all(width: 1,color: Colors.teal),borderRadius: BorderRadius.circular(12)),
                child: Card(
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      Text('Historial médico',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18,),)
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.all(24),
            child: Column(
              children: [
                buildVacunas(),
                const Padding(padding: EdgeInsets.all(5)),
                buildMedicaciones(),
                const Padding(padding: EdgeInsets.all(5)),
                buildEsteril(),
                buildMicrochip(),
                ElevatedButton(onPressed: () {
                  print('funciona');
                  AnimalesBD.insert(Mascota(
                      id: 1,
                      especie: '',
                      nombre: '',
                      raza: '',
                      sexo: '',
                      peso: null,
                      color: '',
                      vacunas: vacunasController.text,
                      medicaciones: medicacionesController.text,
                      esterilizado: esterilController.text,
                      microchip: 0));
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Menu()));}, child: Text('TERMINAR')),
              ],
            ),
            ),
        ],
      ),
      ),
    );
  }
}