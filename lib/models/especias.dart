import 'dart:convert';

import 'package:login/models/producto.dart';

class Especias {
    List<Producto> data;

    Especias({
         required this.data,
    });

    factory Especias.fromJson(String str) => Especias.fromMap(json.decode(str));


    factory Especias.fromMap(Map<String, dynamic> json) => Especias(
        data: json["data"] == null ? [] : List<Producto>.from(json["data"]!.map((x) => Producto.fromMap(x))),
    );


}


