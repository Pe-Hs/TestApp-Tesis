import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


class AuthService extends ChangeNotifier {

  final String _baseUrl = 'http://192.168.1.3:4000/api/';

  final storage = FlutterSecureStorage();

  Future<String?> createUser(String email, String password, String nombreUsuario, String apellidoUsuario) async {

    final Map<String, dynamic> registerData = {
      'email' : email,
      'password' : password,
      'nombreUsuario' : nombreUsuario,
      'apellidoUsuario' : apellidoUsuario
    };

    final url = Uri.http(_baseUrl, 'auth/new');

    final resp = await http.post(url, body: json.encode(registerData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp['ok'] = true){
      return null;
    }else{
      return decodedResp['ok']['msg'];
    }

  }

  Future<String?> login(String email, String password) async {

    final Map<String, dynamic> registerData = {
      'email' : email,
      'password' : password,
    };

    final url = Uri.http(_baseUrl, 'auth/');

    final resp = await http.post(url, body: json.encode(registerData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp['ok'] = true){

      await storage.write(key: 'idUsuario', value: decodedResp['uid']);
      await storage.write(key: 'idUsuario', value: decodedResp['rol']);

      return null;
    }else{
      return decodedResp['ok']['msg'];
    }

  }

  Future logout() async {
    await storage.delete(key: 'uid');
    await storage.delete(key: 'rol');
    return;
  }

}