
import 'dart:convert';

class Usuario {
    String? id;
    String? email;
    String? password;
    String? rol;
    int? v;

    Usuario({
        this.id,
        this.email,
        this.password,
        this.rol,
        this.v,
    });

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        rol: json["rol"],
        v: json["__v"],
    );
}
