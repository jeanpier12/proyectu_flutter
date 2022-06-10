import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/inicio/home_screen.dart';
import 'package:udemy_flutter_delivery/src/pages/login/login_page.dart';
import 'package:udemy_flutter_delivery/src/pages/register/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '¡Bienvenidos!',
      debugShowCheckedModeBanner: false,
      //ruta_Raiz
      initialRoute: '/home',
      //controlador de rutas
      getPages: [
        GetPage(name: '/home', page: () => HomePageScreen()),
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
      ],
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 56, 76, 206),
          colorScheme: const ColorScheme(
              primary: Color.fromARGB(255, 56, 76, 206),
              secondary: Color.fromARGB(255, 56, 76, 206),
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.grey)),
      navigatorKey: Get.key,
    );
  }
}
