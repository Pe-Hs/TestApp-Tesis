import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login/providers/user_data_provider.dart';
import 'package:login/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../ui/input_decoration.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Datos Personales'),
        actions: [
          IconButton(
          icon: Icon(Icons.logout_outlined),
          onPressed: (){
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          } ,
        ),
        ],
      ),
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
            children: [
              SizedBox(height: 30),
              ChangeNotifierProvider(
                  create: (_) => 
                  UserDataFormProvider(), child: _RegisterForm())
             ],
                  ),
          ),
          SizedBox(height: 50),
        ],
      ),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<UserDataFormProvider>(context);

    return Container(
      child: Form(
        key: registerForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '', 
                  labelText: 'Nombres', 
                  prefixIcon: Icons.person),
              onChanged: (value) => registerForm.nombreUsuario = value,
              validator: (value) {
                String pattern = r'^[a-zA-z ]+$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Letras';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Apellidos',
                  prefixIcon: Icons.person),
              onChanged: (value) => registerForm.apellidoUsuario = value,
              validator: (value) {
                String pattern = r'^[a-zA-z ]+$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Letras';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Celular',
                  prefixIcon: Icons.phone),
              onChanged: (value) => registerForm.nroCelular = value,
              validator: (value) {
                String pattern = r'^[0-9]+$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Numeros';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Direccion',
                  prefixIcon: Icons.location_on_outlined),
              onChanged: (value) => registerForm.direccion = value,
              validator: (value) {
                String pattern = r'^.{1,50}$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Maximo 50 Caracteres';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Departamento',
                  prefixIcon: Icons.location_city_outlined),
              onChanged: (value) => registerForm.departamento = value,
              validator: (value) {
                String pattern = r'^[a-zA-z ]{1,20}$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Letras';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Ciudad',
                  prefixIcon: Icons.location_city_outlined),
              onChanged: (value) => registerForm.ciudad = value,
              validator: (value) {
                String pattern = r'^[a-zA-z ]{1,20}$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Letras';
              },
            ),
            SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Distrito',
                  prefixIcon: Icons.location_city_outlined),
              onChanged: (value) => registerForm.distrito = value,
              validator: (value) {
                String pattern = r'^[a-zA-z ]+$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Letras';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Color.fromARGB(255, 255, 222, 173),
                elevation: 0,
                color: Color.fromRGBO(207, 166, 90, 1),
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      registerForm.isLoading ? 'Espere' : 'Actualizar',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                onPressed: registerForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        final storage = FlutterSecureStorage();

                        var idUsuario = await storage.read(key: 'idUsuario');

                        if (!registerForm.isValidForm()) return;

                        registerForm.isLoading = true;

                        final String? errorMessage =
                            await authService.updateUser(
                              idUsuario,
                              registerForm.nombreUsuario, 
                              registerForm.apellidoUsuario, 
                              registerForm.nroCelular, 
                              registerForm.direccion,
                              registerForm.departamento,
                              registerForm.ciudad,
                              registerForm.distrito
                            );

                        if (errorMessage == null) {
                          Navigator.pushReplacementNamed(context, 'home');
                        } else {
                          print(errorMessage);
                          registerForm.isLoading = false;
                        }
                      })
          ],
        ),
      ),
    );
  }
}
