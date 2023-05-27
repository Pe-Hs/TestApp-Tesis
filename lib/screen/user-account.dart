
import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Perfil de Usuario'),
            ElevatedButton(
              child: Text('Cerrar Sesion'),
              onPressed: (){
                _logout(context);
              },
            )
          ],
        ),
      ),
      
    );
  }

  void _logout(BuildContext context) async {
    // final storage = FlutterSecureStorage();
    // await storage.delete(key: 'token');

     Navigator.pushReplacementNamed(context, 'login');
  }
}