import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login/screen/home.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                _login(context);
              },
              child: Text('Inciar Sesion'),
            )
          ],
        ),
      ),
    );
  }

  void _login(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    var url = Uri.http('192.168.1.3:4000', 'api/auth/');

    final response =
        await http.post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'password': password,
            })
        );

    if (response.statusCode == 200) {
      // final token = json.decode(response.body)['token'];
      // final storage = FlutterSecureStorage();
      // await storage.write(key: 'token', value: token);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, 'home');
      
    } else {
     
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text('Error'),
                content: Text('Email o Contraseña Incorrecta'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  )
                ],
              )));
    }
  }
}
