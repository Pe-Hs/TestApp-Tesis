import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class AuthService extends ChangeNotifier {

  final String  _baseUrl = ('192.168.1.5:4000'); 
  // 172.20.111.196
  // final String  _baseUrl = ('172.20.111.196:4000');

  final storage = FlutterSecureStorage();

  Future<String?> createUser(String email, String password, String nombreUsuario, String apellidoUsuario) async {

    final Map<String, dynamic> registerData = {
      'email': email,
      'password': password,
      'nombreUsuario': nombreUsuario,
      'apellidoUsuario': apellidoUsuario
    };

    final url = Uri.http(_baseUrl, '/api/auth/new');

    final resp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerData));

    final Map<String, dynamic> decodedResp = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
      // Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'idUsuario', value: decodedResp['uid']);
      await storage.write(key: 'rol', value: decodedResp['rol']);
      // decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['msg'];
    }
  }

  Future<String?> updateUser(
    var idUsuario,
    String nombreUsuario, 
    String apellidoUsuario,
    String nroCelular, 
    String direccion,
    String departamento, 
    String ciudad,
    String distrito
  ) async {

    final Map<String, dynamic> registerData = {
      'nombreUsuario': nombreUsuario,
      'apellidoUsuario': apellidoUsuario,
      'nroCelular': nroCelular,
      'direccion': direccion,
      'departamento': departamento,
      'ciudad': ciudad,
      'distrito': distrito,

    };

    final url = Uri.http(_baseUrl, '/api/users/editUser/$idUsuario');

    final resp = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(registerData));

    final Map<String, dynamic> decodedResp = jsonDecode(resp.body);

    if (resp.statusCode == 200) {
       return decodedResp['msg'];
    } else {
      return decodedResp['msg'];
    }
  }

  Future<String?> login(String email, String password) async {

    final Map<String, dynamic> registerData = {
      'email' : email,
      'password' : password,
    };

    final url = Uri.http(_baseUrl, 'api/auth/');

    final resp = await http.post(
      url, 
      headers: {'Content-Type': 'application/json'}, 
      body: jsonEncode(registerData)
      );

    final Map<String, dynamic> decodedResp = jsonDecode(resp.body);

    if(resp.statusCode == 200){

      await storage.write(key: 'idUsuario', value: decodedResp['uid']);
      await storage.write(key: 'rol', value: decodedResp['rol']);
     
      return null;

    }else{
      return decodedResp['msg'];
    }

  }

  Future logout() async {
    await storage.delete(key: 'uid');
    await storage.delete(key: 'rol');
    return;
  }

  

}