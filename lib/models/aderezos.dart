
import 'dart:convert';

import 'package:login/models/producto.dart';

class Aderezos {
    List<Producto> data;

    Aderezos({
        required this.data,
    });

    factory Aderezos.fromJson(String str) => Aderezos.fromMap(json.decode(str));

    factory Aderezos.fromMap(Map<String, dynamic> json) => Aderezos(
        data: json["data"] == null ? [] : List<Producto>.from(json["data"]!.map((x) => Producto.fromMap(x))),
    );


}

