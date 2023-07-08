
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login/models/lista_usuarios.dart';



class UserService extends ChangeNotifier {

  final String _baseUrl = ('192.168.1.5:4000');
  // final String _baseUrl = ('172.20.111.196:4000');

  final storage = FlutterSecureStorage();

  List<UsuariosResponse> usuarios = [];


  Future<String> _getJsonData(String endpoint,) async{
    var url = Uri.http(
      _baseUrl,
      endpoint
    );
    final response = await http.get(url);
    return response.body;
  }

  getUser(String idUsuario) async {
    final jsonData = await _getJsonData('/api/users/getUser/$idUsuario');
    final listaUsuarios = UsuariosResponse.fromJson(jsonData);

   

  }
  

  
}
