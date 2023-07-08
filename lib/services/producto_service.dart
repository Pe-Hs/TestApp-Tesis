
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:login/models/aderezos.dart';
import 'package:login/models/especias.dart';

import 'package:login/models/producto.dart';



class ProductoService extends ChangeNotifier {

  final String _baseUrl = ('192.168.1.5:4000');
  // final String _baseUrl = ('172.20.111.196:4000'); 

  List<Producto> productoAderezo = [];
  List<Producto> productoEspecias = [];

  ProductoService(){
     getProductosAderezo();
     getProductosEspecias();
  }

  Future<String> _getJsonData(String endpoint,) async{
    var url = Uri.http(
      _baseUrl,
      endpoint
    );
    final response = await http.get(url);
    return response.body;
  }

  getProductosAderezo() async {
    final jsonData = await _getJsonData('/api/producto/getCategoria/ADEREZO');
    final listaAderezo = Aderezos.fromJson(jsonData);

    productoAderezo = listaAderezo.data;
    notifyListeners();

  }

   getProductosEspecias() async {
    final jsonData = await _getJsonData('/api/producto/getCategoria/ESPECIAS');
    final listaEspecias = Especias.fromJson(jsonData);

    productoEspecias = listaEspecias.data;
    notifyListeners();

  }
  
  
  
}
