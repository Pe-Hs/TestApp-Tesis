// To parse this JSON data, do
//
//     final producto = productoFromMap(jsonString);

import 'dart:convert';

class Producto {
  Producto({
    this.id,
    this.nombreProducto,
    this.descripcionProducto,
    this.precioUnitario,
    this.estado,
    this.cantidad,
    this.stock,
    this.categoria,
    this.mostrarProducto,
    this.imgProducto,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.pesoProducto,
  });

  String? id;
  String? nombreProducto;
  String? descripcionProducto;
  double? precioUnitario;
  String? estado;
  int? cantidad;
  int? stock;
  String? categoria;
  bool? mostrarProducto;
  String? imgProducto;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? pesoProducto;

  get getImgFromBack{
    if(imgProducto != null){
      var re = RegExp(r'(?<=4000)(.*)(?=)');
      String urlData = imgProducto!;
      var match = re.firstMatch(urlData);
      if(match != null){
        ///final String  _baseUrl = ('172.20.111.196:4000');
        /// return 'http://172.20.111.196:4000${match.group(0)}';
        return 'http://192.168.1.5:4000${match.group(0)}';
      }
    }else{
      return 'https://feb.kuleuven.be/drc/LEER/visiting-scholars-1/image-not-available.jpg';
    }
  }

  factory Producto.fromJson(String str) => Producto.fromMap(jsonDecode(str));

  factory Producto.fromMap(Map<String, dynamic> json) => Producto(
        id: json["_id"],
        nombreProducto: json["nombreProducto"],
        descripcionProducto: json["descripcionProducto"],
        precioUnitario: json["precioUnitario"]?.toDouble(),
        estado: json["estado"],
        cantidad: json["cantidad"],
        stock: json["stock"],
        categoria: json["categoria"],
        mostrarProducto: json["mostrarProducto"],
        imgProducto: json["imgProducto"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        pesoProducto: json["pesoProducto"],
      );
}
