import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/providers/users_provider.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //instancioando un objeto llamad0 usersProvider
  UsersProvider usersProvider = UsersProvider();

//funcon que me redirige al login
  void pantallaLogin() {
    Get.toNamed('/');
  }

//creado la función que me redirije al al registro
  void goToRegisterPage() {
    Get.toNamed('/register');
  }

//si alguien aprieta el boton loguin se ejecutara esta funcion

  void login() async {
    //lo que se escriba en el formulario login se guarda en las siguientes variables.
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

//imprimiendo la contraseña y correo
    print('Email ${email}');
    print('Password ${password}');

    //validacion del formulario

//los los datos del login estan completos y correctamente estritos se ejecutara el siguiente
//bloque de codigo
    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProvider.login(email, password);

//este codigo nos imprime como mapa toda la respuesta que tiene el servidor
      print("Response Api: ${responseApi.toJson()}");

      //si el usuario iso login correctamente
      if (responseApi.success == true) {
        Get.snackbar('login exitoso', responseApi.message ?? "");
      }
      //es loguin no fue exitoso
      else {
        Get.snackbar('login fallido', responseApi.message ?? "");
      }
    }
  }

  //funcion que me seive para validar que los campos esten completos y que tienen
  //el formato adecuado debuelve un boolean

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }

    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }

    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    }

    return true;
  }
}
