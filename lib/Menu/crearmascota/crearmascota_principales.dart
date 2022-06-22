import 'dart:ffi';
import 'package:safipet/Menu/crearmascota/pregunta_mas%20datos.dart';
import 'package:safipet/db/animales_db.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:page_transition/page_transition.dart';
import 'package:safipet/Menu/crearmascota/crearmascota_medico.dart';
import 'package:searchfield/searchfield.dart';

import '../../db/animal.dart';

class Crearmascota_principales extends StatefulWidget {
  const Crearmascota_principales({Key? key}) : super(key: key);

  @override
  _Crearmascota_principales createState() => _Crearmascota_principales();
}

class _Crearmascota_principales extends State<Crearmascota_principales> {
  final nombreController = TextEditingController();
  final razaController = TextEditingController();
  final sexoController = TextEditingController();
  final capaController = TextEditingController();
  final fechaController = TextEditingController();

  late String nombre, raza, peso, capa;
  String? sexo;
  late DateTime fecha_n;
  List razas = [
    "Affenpinscher",
    "Pastor Alemán",
    "Airedale terrier",
    "Akita",
    "Akita americano",
    "Alaskan Husky",
    "Alaskan malamute",
    "American Foxhound",
    "American pit bull terrier",
    "American staffordshire terrier",
    "Ariegeois",
    "Artois",
    "Australian silky terrier",
    "Australian Terrier",
    "Austrian Black & Tan Hound",
    "Azawakh",
    "Balkan Hound",
    "Basenji",
    "Basset Alpino (Alpine Dachsbracke)",
    "Basset Artesiano Normando",
    "Basset Azul de Gascuña (Basset Bleu de Gascogne)",
    "Basset de Artois",
    "Basset de Westphalie",
    "Basset Hound",
    "Basset Leonado de Bretaña (Basset fauve de Bretagne)",
    "Bavarian Mountain Scenthound",
    "Beagle",
    "Beagle Harrier",
    "Beauceron",
    "Bedlington Terrier",
    "Bichon Boloñes",
    "Bichón Frisé",
    "Bichón Habanero",
    "Billy",
    "Black and Tan Coonhound",
    "Bloodhound (Sabueso de San Huberto)",
    "Bobtail",
    "Boerboel",
    "Border Collie",
    "Border terrier",
    "Borzoi",
    "Bosnian Hound",
    "Boston terrier",
    "Bouvier des Flandres",
    "Boxer",
    "Boyero de Appenzell",
    "Boyero de Australia",
    "Boyero de Entlebuch",
    "Boyero de las Ardenas",
    "Boyero de Montaña Bernes",
    "Braco Alemán de pelo corto",
    "Braco Alemán de pelo duro",
    "Braco de Ariege",
    "Braco de Auvernia",
    "Braco de Bourbonnais",
    "Braco de Saint Germain",
    "Braco Dupuy",
    "Braco Francés",
    "Braco Italiano",
    "Broholmer",
    "Buhund Noruego",
    "Bull terrier",
    "Bulldog americano",
    "Bulldog inglés",
    "Bulldog francés",
    "Bullmastiff",
    "Ca de Bestiar",
    "Cairn terrier",
    "Cane Corso",
    "Cane da Pastore Maremmano-Abruzzese",
    "Caniche (Poodle)",
    "Caniche Toy (Toy Poodle)",
    "Cao da Serra de Aires",
    "Cao da Serra de Estrela",
    "Cao de Castro Laboreiro",
    "Cao de Fila de Sao Miguel",
    "Cavalier King Charles Spaniel",
    "Cesky Fousek",
    "Cesky Terrier",
    "Chesapeake Bay Retriever",
    "Chihuahua",
    "Chin",
    "Chow Chow",
    "Cirneco del Etna",
    "Clumber Spaniel",
    "Cocker Spaniel Americano",
    "Cocker Spaniel Inglés",
    "Collie Barbudo",
    "Collie de Pelo Cort",
    "Collie de Pelo Largo",
    "Cotón de Tuléar",
    "Curly Coated Retriever",
    "Dálmata",
    "Dandie dinmont terrier",
    "Deerhound",
    "Dobermann",
    "Dogo Argentino",
    "Dogo de Burdeos",
    "Dogo del Tibet",
    "Drentse Partridge Dog",
    "Drever",
    "Dunker",
    "Elkhound Noruego",
    "Elkhound Sueco",
    "English Foxhound",
    "English Springer Spaniel",
    "English Toy Terrier",
    "Epagneul Picard",
    "Eurasier",
    "Fila Brasileiro",
    "Finnish Lapphound",
    "Flat Coated Retriever",
    "Fox terrier de pelo de alambre",
    "Fox terrier de pelo liso",
    "Foxhound Inglés",
    "Frisian Pointer",
    "Galgo Español",
    "Galgo húngaro (Magyar Agar)",
    "Galgo Italiano",
    "Galgo Polaco (Chart Polski)",
    "Glen of Imaal Terrier",
    "Golden Retriever",
    "Gordon Setter",
    "Gos d'Atura Catalá",
    "Gran Basset Griffon Vendeano",
    "Gran Boyero Suizo",
    "Gran Danés (Dogo Aleman)",
    "Gran Gascón Saintongeois",
    "Gran Griffon Vendeano",
    "Gran Munsterlander",
    "Gran Perro Japonés",
    "Grand Anglo Francais Tricoleur",
    "Grand Bleu de Gascogne",
    "Greyhound",
    "Griffon Bleu de Gascogne",
    "Griffon de pelo duro (Grifón Korthals)",
    "Griffon leonado de Bretaña",
    "Griffon Nivernais",
    "Grifon Belga",
    "Grifón de Bruselas",
    "Haldenstoever",
    "Harrier",
    "Hokkaido",
    "Hovawart",
    "Husky Siberiano (Siberian Husky)",
    "Ioujnorousskaia Ovtcharka",
    "Irish Glen of Imaal terrier",
    "Irish soft coated wheaten terrier",
    "Irish terrier",
    "Irish Water Spaniel",
    "Irish Wolfhound",
    "Jack Russell terrier",
    "Jindo Coreano",
    "Kai",
    "Keeshond",
    "Kelpie australiano (Australian kelpie)",
    "Kerry blue terrier",
    "King Charles Spaniel",
    "Kishu",
    "Komondor",
    "Kooiker",
    "Kromfohrländer",
    "Kuvasz",
    "Labrador Retriever",
    "Lagotto Romagnolo",
    "Laika de Siberia Occidental",
    "Laika de Siberia Oriental",
    "Laika Ruso Europeo",
    "Lakeland terrier",
    "Landseer",
    "Lapphund Sueco",
    "Lebrel Afgano",
    "Lebrel Arabe (Sloughi)",
    "Leonberger",
    "Lhasa Apso",
    "Lowchen (Pequeño Perro León)",
    "Lundehund Noruego",
    "Malamute de Alaska",
    "Maltés",
    "Manchester terrier",
    "Mastiff",
    "Mastín de los Pirineos",
    "Mastín Español",
    "Mastín Napolitano",
    "Mudi",
    "Norfolk terrier",
    "Norwich terrier",
    "Nova Scotia duck tolling retriever",
    "Ovejero alemán",
    "Otterhound",
    "Rafeiro do Alentejo",
    "Ratonero Bodeguero Andaluz",
    "Retriever de Nueva Escocia",
    "Rhodesian Ridgeback",
    "Ridgeback de Tailandia",
    "Rottweiler",
    "Saarloos",
    "Sabueso de Hamilton",
    "Sabueso de Hannover",
    "Sabueso de Hygen",
    "Sabueso de Istria",
    "Sabueso de Posavaz",
    "Sabueso de Schiller (Schillerstovare)",
    "Sabueso de Smaland (Smalandsstovare)",
    "Sabueso de Transilvania",
    "Sabueso del Tirol",
    "Sabueso Español",
    "Sabueso Estirio de pelo duro",
    "Sabueso Finlandés",
    "Sabueso Francés blanco y negro",
    "Sabueso Francés tricolor",
    "Sabueso Griego",
    "Sabueso Polaco (Ogar Polski)",
    "Sabueso Serbio",
    "Sabueso Suizo",
    "Sabueso Yugoslavo de Montaña",
    "Sabueso Yugoslavo tricolor",
    "Saluki",
    "Samoyedo",
    "San Bernardo",
    "Sarplaninac",
    "Schapendoes",
    "Schipperke",
    "Schnauzer estándar",
    "Schnauzer gigante (Riesenschnauzer)",
    "Schnauzer miniatura (Zwergschnauzer)",
    "Scottish terrier",
    "Sealyham terrier",
    "Segugio Italiano",
    "Seppala Siberiano",
    "Setter Inglés",
    "Setter Irlandés",
    "Setter Irlandés rojo y blanco",
    "Shar Pei",
    "Shiba Inu",
    "Shih Tzu",
    "Shikoku",
    "Skye terrier",
    "Slovensky Cuvac",
    "Slovensky Kopov",
    "Smoushond Holandés",
    "Spaniel Alemán (German Wachtelhund)",
    "Spaniel Azul de Picardía",
    "Spaniel Bretón",
    "Spaniel de Campo",
    "Spaniel de Pont Audemer",
    "Spaniel Francés",
    "Spaniel Tibetano",
    "Spinone Italiano",
    "Spítz Alemán",
    "Spitz de Norbotten (Norbottenspets)",
    "Spitz Finlandés",
    "Spitz Japonés",
    "Staffordshire bull terrier",
    "Staffordshire terrier americano",
    "Sussex Spaniel",
    "Teckel (Dachshund)",
    "Tchuvatch eslovaco",
    "Terranova (Newfoundland)",
    "Terrier australiano (Australian terrier)",
    "Terrier brasilero",
    "Terrier cazador alemán",
    "Terrier checo (Ceský teriér)",
    "Terrier galés",
    "Terrier irlandés (Irish terrier)",
    "Terrier japonés (Nihon teria)",
    "Terrier negro ruso",
    "Terrier tibetano",
    "Tosa",
    "Viejo Pastor Inglés",
    "Viejo Pointer Danés (Old Danish Pointer)",
    "Vizsla",
    "Volpino Italiano",
    "Weimaraner",
    "Welsh springer spaniel",
    "Welsh Corgi Cardigan",
    "Welsh Corgi Pembroke",
    "Welsh terrier",
    "West highland white terrier",
    "Whippet",
    "Wirehaired solvakian pointer",
    "Xoloitzcuintle",
    "Yorkshire Terrier",
    "Abisinio",
    "American Curl",
    "Azul ruso",
    "American shorthair",
    "American wirehair",
    "Angora turco",
    "Africano doméstico",
    "B",
    "Bembomba Almumema",
    "Bengala",
    "Bobtail japonés",
    "Bombay",
    "Bosque de Noruega",
    "Brazilian Shorthair",
    "Brivon de pelo corto",
    "Brivon de pelo largo",
    "British Shorthair",
    "British Longhair",
    "Burmés",
    "Burmilla",
    "Cornish rex",
    "California Spangled",
    "Cymric",
    "Chartreux",
    "Gato Carey",
    "Devon rex",
    "Dorado africano",
    "Don Sphynx",
    "Dragon Li",
    "Europeo Común",
    "Exótico de Pelo Corto",
    "Gato europeo bicolor",
    "FoldEx",
    "G",
    "German Rex",
    "H",
    "Habana brown",
    "Himalayo",
    "K",
    "Korat",
    "Khao Manee",
    "Manx",
    "Mau egipcio",
    "Ocicat",
    "Oriental",
    "Oriental de pelo largo",
    "Persa Americano o Moderno",
    "Peterbald",
    "Pixie Bob",
    "R",
    "Gato rojo",
    "Ragdoll",
    "Sagrado de Birmania",
    "Savannah",
    "Scottish Fold",
    "Selkirk rex",
    "Serengeti",
    "Seychellois",
    "Siamés",
    "Siamés Moderno",
    "Siamés Tradicional",
    "Siberiano",
    "Snowshoe",
    "Sphynx",
    "T",
    "Tonkinés",
    "Van Turco"
  ];

  final GlobalKey<FormState> claveformulario = GlobalKey<FormState>();

  Widget buildNombre() {
    return TextFormField(
      controller: nombreController,
      decoration: const InputDecoration(labelText: 'Nombre'),
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Introduce un nombre';
        }
      },
      onSaved: (valor) {
        nombre = valor!;
      },
    );
  }

  Widget buildRaza() {
    return SearchField(
      controller: razaController,
      suggestions: razas.map((e) => SearchFieldListItem(e)).toList(),
      suggestionState: Suggestion.expand,
      hint: 'Especie',
    );
  }

  /*Widget buildSexo(){
     return DropdownButton<String>(
       alignment: Alignment.center,
       isExpanded: true,
       value: sexo,
       hint: const Text("Sexo"),
       underline: Container(
         height: 1,
         color: Colors.black,
       ),
       icon: const Icon(Icons.arrow_drop_down),
       onChanged: (String? newValor) {
         setState(() {
           sexo = newValor ?? "";
         });
       },
       items: <String>['Macho', 'Hembra','Indeterminado']
           .map<DropdownMenuItem<String>>((String valor) {
         return DropdownMenuItem<String>(
           value: valor,
           child: Text(valor),
         );
       }).toList(),
     );
   }*/

  Widget buildSexo() {
    return TextFormField(
      controller: sexoController,
      decoration: const InputDecoration(labelText: 'Sexo'),
      keyboardType: TextInputType.text,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Introduce el sexo';
        }
      },
      onSaved: (valor) {
        capa = valor!;
      },
    );
  }

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

  Widget buildCapa() {
    return TextFormField(
      controller: capaController,
      decoration: const InputDecoration(labelText: 'Capa/Color'),
      keyboardType: TextInputType.text,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Introduce una capa/color';
        }
      },
      onSaved: (valor) {
        capa = valor!;
      },
    );
  }

  Widget buildFecha() {
    return TextFormField(
      controller: fechaController,
      decoration: const InputDecoration(labelText: 'Fecha de nacimiento'),
      keyboardType: TextInputType.datetime,
      validator: (valor) {
        if (valor == null || valor.isEmpty) {
          return 'Introduce la fecha de nacimiento';
        }
      },
      onSaved: (valor) {
        fecha_n = valor! as DateTime;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Mascota mascota = Mascota(
        id: 0,
        especie: 'a',
        nombre: 'a',
        raza: 'a',
        sexo: 'a',
        peso: 1,
        color: 'a',
        vacunas: 'no',
        medicaciones: 'no',
        esterilizado: '',
        microchip: 0);

    //Mascota mascota = ModalRoute.of(context)?.settings.arguments as Mascota;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('imagenes/fondobasico.png'),
                fit: BoxFit.fill)),
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
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all(width: 1, color: Colors.teal),
                      borderRadius: BorderRadius.circular(12)),
                  child: Card(
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Stack(
                      alignment: Alignment.center,
                      children: const [
                        Text(
                          'Datos principales',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(24),
              child: Form(
                key: claveformulario,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //_FormSave(),
                    buildNombre(),
                    buildRaza(),
                    buildSexo(),
                    buildCapa(),
                    const SizedBox(height: 25),
                    /*ElevatedButton(
                    child: Text('SIGUIENTE'),
                    onPressed: (){
                      if(!claveformulario.currentState!.validate()){
                        print("Valido"+nombreController.text);
                        AnimalesBD.insert(Mascota(id: 1, especie: '', nombre: nombreController.text, raza: razaController.text, sexo: sexoController.text, peso: pesoController.text as int, color: capaController.text, vacunas: '', medicaciones: '', esterilizado: '', microchip: 0));
                      }
                      Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftJoined,childCurrent: Crearmascota_principales(), child: PreguntaDatos()));
                      claveformulario.currentState!.save();
                    },
                  ),*/
                    ElevatedButton(
                        onPressed: () {
                          if (claveformulario.currentState!.validate()) {
                            if (mascota.nombre.isNotEmpty &&
                                !mascota.especie.isNotEmpty &&
                                mascota.nombre == nombreController.text) {
                              print('entro al update');
                              mascota.nombre = nombreController.text;
                              mascota.raza = razaController.text;
                              mascota.sexo = sexoController.text;
                              mascota.color = capaController.text;
                              AnimalesBD.update(mascota);
                            } else {
                              print('entro al insert');
                              AnimalesBD.insert(Mascota(
                                  id: mascota.id,
                                  especie: mascota.especie,
                                  nombre: nombreController.text,
                                  raza: razaController.text,
                                  sexo: sexoController.text,
                                  color: capaController.text,
                                  esterilizado: '',
                                  vacunas: '',
                                  microchip: 0,
                                  medicaciones: '',
                                  peso: null));
                            }
                          } else {
                            print('no entro');
                          }
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeftJoined,
                                  childCurrent: Crearmascota_principales(),
                                  child: PreguntaDatos()));
                          claveformulario.currentState!.save();
                        },
                        child: const Text('SIGUIENTE'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FormSave extends StatelessWidget {
  final nombreController = TextEditingController();
  final razaController = TextEditingController();
  final sexoController = TextEditingController();
  final pesoController = TextEditingController();
  final capaController = TextEditingController();
  final fechaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List razas = [
    "Affenpinscher",
    "Pastor Alemán",
    "Airedale terrier",
    "Akita",
    "Akita americano",
    "Alaskan Husky",
    "Alaskan malamute",
    "American Foxhound",
    "American pit bull terrier",
    "American staffordshire terrier",
    "Ariegeois",
    "Artois",
    "Australian silky terrier",
    "Australian Terrier",
    "Austrian Black & Tan Hound",
    "Azawakh",
    "Balkan Hound",
    "Basenji",
    "Basset Alpino (Alpine Dachsbracke)",
    "Basset Artesiano Normando",
    "Basset Azul de Gascuña (Basset Bleu de Gascogne)",
    "Basset de Artois",
    "Basset de Westphalie",
    "Basset Hound",
    "Basset Leonado de Bretaña (Basset fauve de Bretagne)",
    "Bavarian Mountain Scenthound",
    "Beagle",
    "Beagle Harrier",
    "Beauceron",
    "Bedlington Terrier",
    "Bichon Boloñes",
    "Bichón Frisé",
    "Bichón Habanero",
    "Billy",
    "Black and Tan Coonhound",
    "Bloodhound (Sabueso de San Huberto)",
    "Bobtail",
    "Boerboel",
    "Border Collie",
    "Border terrier",
    "Borzoi",
    "Bosnian Hound",
    "Boston terrier",
    "Bouvier des Flandres",
    "Boxer",
    "Boyero de Appenzell",
    "Boyero de Australia",
    "Boyero de Entlebuch",
    "Boyero de las Ardenas",
    "Boyero de Montaña Bernes",
    "Braco Alemán de pelo corto",
    "Braco Alemán de pelo duro",
    "Braco de Ariege",
    "Braco de Auvernia",
    "Braco de Bourbonnais",
    "Braco de Saint Germain",
    "Braco Dupuy",
    "Braco Francés",
    "Braco Italiano",
    "Broholmer",
    "Buhund Noruego",
    "Bull terrier",
    "Bulldog americano",
    "Bulldog inglés",
    "Bulldog francés",
    "Bullmastiff",
    "Ca de Bestiar",
    "Cairn terrier",
    "Cane Corso",
    "Cane da Pastore Maremmano-Abruzzese",
    "Caniche (Poodle)",
    "Caniche Toy (Toy Poodle)",
    "Cao da Serra de Aires",
    "Cao da Serra de Estrela",
    "Cao de Castro Laboreiro",
    "Cao de Fila de Sao Miguel",
    "Cavalier King Charles Spaniel",
    "Cesky Fousek",
    "Cesky Terrier",
    "Chesapeake Bay Retriever",
    "Chihuahua",
    "Chin",
    "Chow Chow",
    "Cirneco del Etna",
    "Clumber Spaniel",
    "Cocker Spaniel Americano",
    "Cocker Spaniel Inglés",
    "Collie Barbudo",
    "Collie de Pelo Cort",
    "Collie de Pelo Largo",
    "Cotón de Tuléar",
    "Curly Coated Retriever",
    "Dálmata",
    "Dandie dinmont terrier",
    "Deerhound",
    "Dobermann",
    "Dogo Argentino",
    "Dogo de Burdeos",
    "Dogo del Tibet",
    "Drentse Partridge Dog",
    "Drever",
    "Dunker",
    "Elkhound Noruego",
    "Elkhound Sueco",
    "English Foxhound",
    "English Springer Spaniel",
    "English Toy Terrier",
    "Epagneul Picard",
    "Eurasier",
    "Fila Brasileiro",
    "Finnish Lapphound",
    "Flat Coated Retriever",
    "Fox terrier de pelo de alambre",
    "Fox terrier de pelo liso",
    "Foxhound Inglés",
    "Frisian Pointer",
    "Galgo Español",
    "Galgo húngaro (Magyar Agar)",
    "Galgo Italiano",
    "Galgo Polaco (Chart Polski)",
    "Glen of Imaal Terrier",
    "Golden Retriever",
    "Gordon Setter",
    "Gos d'Atura Catalá",
    "Gran Basset Griffon Vendeano",
    "Gran Boyero Suizo",
    "Gran Danés (Dogo Aleman)",
    "Gran Gascón Saintongeois",
    "Gran Griffon Vendeano",
    "Gran Munsterlander",
    "Gran Perro Japonés",
    "Grand Anglo Francais Tricoleur",
    "Grand Bleu de Gascogne",
    "Greyhound",
    "Griffon Bleu de Gascogne",
    "Griffon de pelo duro (Grifón Korthals)",
    "Griffon leonado de Bretaña",
    "Griffon Nivernais",
    "Grifon Belga",
    "Grifón de Bruselas",
    "Haldenstoever",
    "Harrier",
    "Hokkaido",
    "Hovawart",
    "Husky Siberiano (Siberian Husky)",
    "Ioujnorousskaia Ovtcharka",
    "Irish Glen of Imaal terrier",
    "Irish soft coated wheaten terrier",
    "Irish terrier",
    "Irish Water Spaniel",
    "Irish Wolfhound",
    "Jack Russell terrier",
    "Jindo Coreano",
    "Kai",
    "Keeshond",
    "Kelpie australiano (Australian kelpie)",
    "Kerry blue terrier",
    "King Charles Spaniel",
    "Kishu",
    "Komondor",
    "Kooiker",
    "Kromfohrländer",
    "Kuvasz",
    "Labrador Retriever",
    "Lagotto Romagnolo",
    "Laika de Siberia Occidental",
    "Laika de Siberia Oriental",
    "Laika Ruso Europeo",
    "Lakeland terrier",
    "Landseer",
    "Lapphund Sueco",
    "Lebrel Afgano",
    "Lebrel Arabe (Sloughi)",
    "Leonberger",
    "Lhasa Apso",
    "Lowchen (Pequeño Perro León)",
    "Lundehund Noruego",
    "Malamute de Alaska",
    "Maltés",
    "Manchester terrier",
    "Mastiff",
    "Mastín de los Pirineos",
    "Mastín Español",
    "Mastín Napolitano",
    "Mudi",
    "Norfolk terrier",
    "Norwich terrier",
    "Nova Scotia duck tolling retriever",
    "Ovejero alemán",
    "Otterhound",
    "Rafeiro do Alentejo",
    "Ratonero Bodeguero Andaluz",
    "Retriever de Nueva Escocia",
    "Rhodesian Ridgeback",
    "Ridgeback de Tailandia",
    "Rottweiler",
    "Saarloos",
    "Sabueso de Hamilton",
    "Sabueso de Hannover",
    "Sabueso de Hygen",
    "Sabueso de Istria",
    "Sabueso de Posavaz",
    "Sabueso de Schiller (Schillerstovare)",
    "Sabueso de Smaland (Smalandsstovare)",
    "Sabueso de Transilvania",
    "Sabueso del Tirol",
    "Sabueso Español",
    "Sabueso Estirio de pelo duro",
    "Sabueso Finlandés",
    "Sabueso Francés blanco y negro",
    "Sabueso Francés tricolor",
    "Sabueso Griego",
    "Sabueso Polaco (Ogar Polski)",
    "Sabueso Serbio",
    "Sabueso Suizo",
    "Sabueso Yugoslavo de Montaña",
    "Sabueso Yugoslavo tricolor",
    "Saluki",
    "Samoyedo",
    "San Bernardo",
    "Sarplaninac",
    "Schapendoes",
    "Schipperke",
    "Schnauzer estándar",
    "Schnauzer gigante (Riesenschnauzer)",
    "Schnauzer miniatura (Zwergschnauzer)",
    "Scottish terrier",
    "Sealyham terrier",
    "Segugio Italiano",
    "Seppala Siberiano",
    "Setter Inglés",
    "Setter Irlandés",
    "Setter Irlandés rojo y blanco",
    "Shar Pei",
    "Shiba Inu",
    "Shih Tzu",
    "Shikoku",
    "Skye terrier",
    "Slovensky Cuvac",
    "Slovensky Kopov",
    "Smoushond Holandés",
    "Spaniel Alemán (German Wachtelhund)",
    "Spaniel Azul de Picardía",
    "Spaniel Bretón",
    "Spaniel de Campo",
    "Spaniel de Pont Audemer",
    "Spaniel Francés",
    "Spaniel Tibetano",
    "Spinone Italiano",
    "Spítz Alemán",
    "Spitz de Norbotten (Norbottenspets)",
    "Spitz Finlandés",
    "Spitz Japonés",
    "Staffordshire bull terrier",
    "Staffordshire terrier americano",
    "Sussex Spaniel",
    "Teckel (Dachshund)",
    "Tchuvatch eslovaco",
    "Terranova (Newfoundland)",
    "Terrier australiano (Australian terrier)",
    "Terrier brasilero",
    "Terrier cazador alemán",
    "Terrier checo (Ceský teriér)",
    "Terrier galés",
    "Terrier irlandés (Irish terrier)",
    "Terrier japonés (Nihon teria)",
    "Terrier negro ruso",
    "Terrier tibetano",
    "Tosa",
    "Viejo Pastor Inglés",
    "Viejo Pointer Danés (Old Danish Pointer)",
    "Vizsla",
    "Volpino Italiano",
    "Weimaraner",
    "Welsh springer spaniel",
    "Welsh Corgi Cardigan",
    "Welsh Corgi Pembroke",
    "Welsh terrier",
    "West highland white terrier",
    "Whippet",
    "Wirehaired solvakian pointer",
    "Xoloitzcuintle",
    "Yorkshire Terrier",
    "Abisinio",
    "American Curl",
    "Azul ruso",
    "American shorthair",
    "American wirehair",
    "Angora turco",
    "Africano doméstico",
    "B",
    "Bembomba Almumema",
    "Bengala",
    "Bobtail japonés",
    "Bombay",
    "Bosque de Noruega",
    "Brazilian Shorthair",
    "Brivon de pelo corto",
    "Brivon de pelo largo",
    "British Shorthair",
    "British Longhair",
    "Burmés",
    "Burmilla",
    "Cornish rex",
    "California Spangled",
    "Cymric",
    "Chartreux",
    "Gato Carey",
    "Devon rex",
    "Dorado africano",
    "Don Sphynx",
    "Dragon Li",
    "Europeo Común",
    "Exótico de Pelo Corto",
    "Gato europeo bicolor",
    "FoldEx",
    "G",
    "German Rex",
    "H",
    "Habana brown",
    "Himalayo",
    "K",
    "Korat",
    "Khao Manee",
    "Manx",
    "Mau egipcio",
    "Ocicat",
    "Oriental",
    "Oriental de pelo largo",
    "Persa Americano o Moderno",
    "Peterbald",
    "Pixie Bob",
    "R",
    "Gato rojo",
    "Ragdoll",
    "Sagrado de Birmania",
    "Savannah",
    "Scottish Fold",
    "Selkirk rex",
    "Serengeti",
    "Seychellois",
    "Siamés",
    "Siamés Moderno",
    "Siamés Tradicional",
    "Siberiano",
    "Snowshoe",
    "Sphynx",
    "T",
    "Tonkinés",
    "Van Turco"
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            controller: nombreController,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return "Introduzca un nombre";
              }
            },
            decoration: InputDecoration(
              labelText: 'Nombre',
            ),
          ),
          SearchField(
            controller: razaController,
            suggestions: razas.map((e) => SearchFieldListItem(e)).toList(),
            suggestionState: Suggestion.expand,
            hint: 'Especie',
          ),
          TextFormField(
            controller: sexoController,
            keyboardType: TextInputType.text,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return "Introduzca el sexo";
              }
            },
            decoration: InputDecoration(
              labelText: 'Sexo',
            ),
          ),
          TextFormField(
            controller: pesoController,
            keyboardType: TextInputType.number,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return "Introduzca el peso";
              }
            },
            decoration: InputDecoration(
              labelText: 'Peso',
            ),
          ),
          TextFormField(
            controller: capaController,
            keyboardType: TextInputType.text,
            validator: (valor) {
              if (valor == null || valor.isEmpty) {
                return "Introduzca un color";
              }
            },
            decoration: InputDecoration(
              labelText: 'Capa/Color',
            ),
          ),
          ElevatedButton(
            child: Text('SIGUIENTE'),
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                print('funciona');
                AnimalesBD.insert(Mascota(
                    id: 1,
                    especie: '',
                    nombre: nombreController.text,
                    raza: razaController.text,
                    sexo: sexoController.text,
                    peso: pesoController.text as int,
                    color: capaController.text,
                    vacunas: '',
                    medicaciones: '',
                    esterilizado: '',
                    microchip: 0));
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeftJoined,
                        childCurrent: Crearmascota_principales(),
                        child: PreguntaDatos()));
                _formKey.currentState!.save();
              }
            },
          ),
        ],
      ),
    );
  }
}
