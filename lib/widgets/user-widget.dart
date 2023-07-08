import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class UserInfoBar extends StatefulWidget {
  const UserInfoBar({super.key});

  @override
  State<UserInfoBar> createState() => _UserInfoBarState();
}

class _UserInfoBarState extends State<UserInfoBar> {

  String name = "";
  String lastName = "";

  final storage = FlutterSecureStorage();

  fetchJson() async {
    final Map<String, dynamic> registerData = {};
    var idUsuario = await storage.read(key: 'idUsuario');
    var url = Uri.http('192.168.1.5:4000', '/api/users/getUser/$idUsuario');

    var resp = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );

    if(resp.statusCode == 200){
      String responseBody = resp.body;
      var respJson = json.decode(responseBody);
      name = respJson['nombreUsuario'];
      lastName = respJson['apellidoUsuario'];
    }else{
      print('Na Pa! no funca');
    }

  }

  @override
  void initState() {
    fetchJson();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10), 
        padding: EdgeInsets.all(10), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Text(
                  '$name $lastName',
                  style: TextStyle(                    
                    fontSize: 21
                  ),
                ),
              ],
            ),
            Icon(Ionicons.person_circle_outline, size: 40, color: Colors.amber,)
          ],
        )
    );
  }
}
