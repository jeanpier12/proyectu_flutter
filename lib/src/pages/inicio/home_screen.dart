import 'package:flutter/material.dart';
//paqueta que controla las rutas
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/login/login_controller.dart';
// ignore: unused_import
import 'package:udemy_flutter_delivery/src/pages/login/login_page.dart';

// ignore: use_key_in_widget_constructors
class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

//funcuón para moverme de pantalla

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget imagenFondo() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/Madrid4.jpg'), fit: BoxFit.cover)),
    );
  }
//codigo para poner opacyty
  // final whiteOpacity = Container(
  //   color: Colors.white54,
  // );

  Widget _textoInicio() {
    return const Text(
      'Bienvenido a  mi aplicación ',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    );
  }

  LoginController con = Get.put(LoginController());

//cambiar estructura del botom
  Widget buttonI() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          //se llamando la función del login
          onPressed: () => con.pantallaLogin(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18)),
          child: const Text(
            'INICIAR',
            style: TextStyle(color: Colors.white),
          )),
    );
  }

//esto se muestra en pantalla
  @override
  Widget build(BuildContext context) {
    final logo = ScaleTransition(
      scale: animation,
      child: Image.asset(
        'assets/img/logo.png',
        width: 200,
        height: 200,
      ),
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          imagenFondo(),
          // whiteOpacity,
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                logo,
                _textoInicio(),
                //llamando al botom
                buttonI()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
