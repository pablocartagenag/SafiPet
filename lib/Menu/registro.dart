

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safipet/Menu/menu.dart';

class Registro extends StatefulWidget {

  @override
  _RegistroState createState() => _RegistroState();

}

class _RegistroState extends State<Registro> {

  GlobalKey<FormState> claveformulario=GlobalKey<FormState>();
  TextEditingController emailController= TextEditingController();
  TextEditingController passController1= TextEditingController();
  TextEditingController passController2= TextEditingController();
  static bool visible=false;
  FirebaseAuth auth=FirebaseAuth.instance;

  void initState(){
    super.initState();
    visible=false;
  }

  @override
  Widget build(BuildContext context) {
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
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagenes/fondologopeque.png'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    style: TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      labelText: 'Introduzca su correo', prefixIcon: Icon(Icons.email, color: Colors.teal,)
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController1,
                  obscureText: true,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(labelText: 'Introduzca una contraseña',
                    prefixIcon: Icon(Icons.lock, color: Colors.teal,),
                  ),
                ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passController2,
                  obscureText: true,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(labelText: 'Repita la contraseña',
                    prefixIcon: Icon(Icons.lock, color: Colors.teal,),
                  ),
                ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                  onPressed: (){
                    if(!emailController.text.contains('@')){
                      mostrarMensajeSnackBar('Introduzca un email correcto', context);
                    }else if(passController1.text.length<8){
                      mostrarMensajeSnackBar('La contraseña debe tener al menos 8 carácteres', context);
                    }else if(passController1.text!= passController2.text){
                      mostrarMensajeSnackBar('Las contraseñas no coinciden', context);
                    }else{
                      registroNuevoUsuario(context);
                    }
                  },
                  child: const Text('Crear cuenta'),
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose(){
    emailController.dispose();
    passController1.dispose();
    passController2.dispose();
    super.dispose();

  }

  Future<void> registroNuevoUsuario(BuildContext context) async {
    User usuario;
    try{
      usuario=(await auth.createUserWithEmailAndPassword(email:emailController.text.trim(), password: passController1.text.trim())).user!;
      mostrarMensajeSnackBar("Usuario creado", context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => new  Menu()));
    }on FirebaseAuthException catch (e){
      if(e.code=="weak-password"){
        mostrarMensajeSnackBar("Contraseña débil", context);
      }else if(e.code=="email-already-in-use"){
        mostrarMensajeSnackBar("Este email ya está en uso", context);
      }else{
        mostrarMensajeSnackBar("Ha ocurrido un error", context);
      }
    } catch (e){
      mostrarMensajeSnackBar("Ha ocurrido un error", context);
    }
  }

  void mostrarMensajeSnackBar(String message, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1200),
    ));
  }
}
