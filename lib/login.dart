import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:safipet/Menu/menu.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:safipet/Menu/registro.dart';
import 'package:twitter_login/twitter_login.dart';



class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  FirebaseAuth auth= FirebaseAuth.instance;

  final GlobalKey<FormState> claveformulario = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage('imagenes/fondoinicio.png'), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      labelText: 'Usuario', prefixIcon: Icon(Icons.email, color: Colors.teal,),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock, color: Colors.teal,),
                ),
                ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {},
                    child: const Text('¿Olvidaste la contraseña?',
                        style: TextStyle(color: Colors.teal, fontSize: 15)),
                  ),
                ),
                Padding(padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Registro()));},
                    child: const Text('Crear cuenta', style: TextStyle(
                        color: Colors.teal,
                        fontSize: 15,
                        decoration: TextDecoration.underline)),
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
                      onPressed:(){
                        if(!emailController.text.contains('@')){
                          mostrarMensajeSnackBar('Email incorrecto', context);
                        }else if (passwordController.text.length<8){
                          mostrarMensajeSnackBar('La contraseña debe tener al menos 8 caracteres', context);
                        }else{
                          iniciar_sesion(context);
                        }
                      },
                      child: const Text('Iniciar sesion'),)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  Buttons.GoogleDark,
                  onPressed: () {signInGoogle(context);},
                  text: 'Iniciar sesión con Google',
                ),

              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignInButton(Buttons.Facebook, onPressed: () {loginFacebook(context);}, mini: true,),
                  SignInButton(Buttons.Twitter, onPressed: () {loginTwitter(context);}, mini: true,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future iniciar_sesion(BuildContext context) async {
    //metodo que intenta iniciar sesión con los parámetros pasados de usuario y contraseña
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  Future<void> acceder (BuildContext context) async {
    final formState=claveformulario.currentState;
    if(formState!.validate()){
      formState.save();
      try {
        FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
        Navigator.push(context, MaterialPageRoute(builder: (context)=> new Menu()));
      } on FirebaseAuthException catch(e){
        if(e.code=="user-not-found") {
          mostrarMensajeSnackBar("Correo no registrado", context);
        } else if(e.code=="wrong password") {
          mostrarMensajeSnackBar("Contraseña incorrecta", context);
        } else {
          mostrarMensajeSnackBar("Se ha producido en error", context);
        }
      }
      }
    }


  void mostrarMensajeSnackBar(String message, BuildContext context) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1200),
    ));
  }

  Future<void> signInGoogle(BuildContext context) async{
    final FirebaseAuth _auth= FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn= new GoogleSignIn();

    try{

      final GoogleSignInAccount? _googleSignInAccount= await _googleSignIn.signIn();
      final GoogleSignInAuthentication _googleSignInAuthentication= await _googleSignInAccount!.authentication;
      final AuthCredential credential= GoogleAuthProvider.credential(
        accessToken: _googleSignInAuthentication.accessToken,
        idToken: _googleSignInAuthentication.idToken,
      );

      await _auth.signInWithCredential(credential);
      claveformulario.currentState!.save();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> new Menu()));

    }catch (e){
      mostrarMensajeSnackBar('Se ha producido un error', context);
    }
  }

  Future<void> loginTwitter(BuildContext context) async{
    final login= TwitterLogin(apiKey: 'nZYW7TcgAs2qtLesCsSLcTwRv', apiSecretKey: '7K2itdvGyb6nvDdM1MrK3rVb3cZJ7mgd2XV4Weyyu9eccQbyPs', redirectURI: 'flutter-twitter-login://');
    await login.login().then((value) async{

      final twitterAuthCredentials= TwitterAuthProvider.credential(accessToken: value.authToken!, secret: value.authTokenSecret!);

      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredentials);
    });

  }

  Future<void> loginFacebook(BuildContext context)async{

    final LoginResult loginResult= await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential= FacebookAuthProvider.credential(loginResult.accessToken!.token);

    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
  
}



