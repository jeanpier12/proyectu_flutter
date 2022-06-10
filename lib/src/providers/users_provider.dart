import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/environment/environment.dart';
import 'package:udemy_flutter_delivery/src/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/models/user.dart';

class UsersProvider extends GetConnect {
  String url = Environment.API_URL + 'api/users';

// aca se intenta hacer una petición http para crear un usuario
  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(), headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

    return response;
  }

//la funcion login va a hacer una peticion http al servidor
//el cualnos permitira consutar si podemis ingreasar o no
  Future<ResponseApi> login(String email, String password) async {
    Response response = await post('$url/login', {
      "email": email,
      "password": password
    }, headers: {
      'Content-Type': 'application/json'
    }); // ESPERAR HASTA QUE EL SERVIDOR NOS RETORNE LA RESPUESTA

//si el servidor no me trae ninguna respuesta se ejecutara el siguiente codigo
    if (response.body == null) {
      Get.snackbar("Error", "no se pudo ejecutar la petición");
      return ResponseApi();
    }

    //en caso encuentre algo nos traera un json con datos
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}
