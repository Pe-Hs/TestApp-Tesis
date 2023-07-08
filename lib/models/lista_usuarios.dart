
import 'dart:convert';



class UsuariosResponse {
    String id;
    UsuarioId usuarioId;
    String nombreUsuario;
    String apellidoUsuario;
    int v;
    String? ciudad;
    String? departamento;
    String direccion;
    String? distrito;
    String? dni;
    String? nroCelular;

    UsuariosResponse({
        required this.id,
        required this.usuarioId,
        required this.nombreUsuario,
        required this.apellidoUsuario,
        required this.v,
        this.ciudad,
        this.departamento,
        required this.direccion,
        this.distrito,
        this.dni,
        this.nroCelular,
    });

    factory UsuariosResponse.fromJson(String str) => UsuariosResponse.fromMap(json.decode(str));

    factory UsuariosResponse.fromMap(Map<String, dynamic> json) => UsuariosResponse(
        id: json["_id"],
        usuarioId: UsuarioId.fromMap(json["usuarioId"]),
        nombreUsuario: json["nombreUsuario"],
        apellidoUsuario: json["apellidoUsuario"],
        v: json["__v"],
        ciudad: json["ciudad"],
        departamento: json["departamento"],
        direccion: json["direccion"],
        distrito: json["distrito"],
        dni: json["dni"],
        nroCelular: json["nroCelular"],
    );
}

class UsuarioId {
    String id;
    String email;
    String password;
    String rol;
    int v;

    UsuarioId({
        required this.id,
        required this.email,
        required this.password,
        required this.rol,
        required this.v,
    });

    factory UsuarioId.fromJson(String str) => UsuarioId.fromMap(json.decode(str));


    factory UsuarioId.fromMap(Map<String, dynamic> json) => UsuarioId(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        rol: json["rol"],
        v: json["__v"],
    );

}
