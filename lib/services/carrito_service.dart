import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CarritoService extends ChangeNotifier {

  final String _baseUrl = ('192.168.1.5:4000');

  final storage = FlutterSecureStorage();

  Future<String?> crearCarrito(String? idCliente) async {

    final Map<String, dynamic> data = {
      'cliente': idCliente,
    };

    final url = Uri.http(_baseUrl, '/api/cart/newCart');

    final resp = await http.post(url,
        headers: {'Content-Type': 'application/json'}, 
        body: jsonEncode(data)
      );

    final Map<String, dynamic> decodedResp = jsonDecode(resp.body);

     if (resp.statusCode == 200) {
      await storage.write(key: 'idCart', value: decodedResp['id']);
      return await storage.read(key: 'idCart');
     }else{
      return decodedResp['msg'];
     }
  }
}
