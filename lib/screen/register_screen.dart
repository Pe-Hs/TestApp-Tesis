

import 'package:flutter/material.dart';
import 'package:login/providers/register_form_provider.dart';
import 'package:login/services/auth_service.dart';


import 'package:login/ui/input_decoration.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBack(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox( height: 250 ),

              CardContainer(
                child: Column(
                  children: [

                    SizedBox( height: 10 ),
                    Text('Crear cuenta', style: Theme.of(context).textTheme.headline4 ),
                    SizedBox( height: 30 ),
                    
                    ChangeNotifierProvider(
                      create: ( _ ) => RegisterFormProvider(),
                      child: _RegisterForm()
                    )
                    

                  ],
                )
              ),

              SizedBox( height: 50 ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login'), 
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all( StadiumBorder() )
                ),
                child: Text('¿Ya tienes una cuenta?', style: TextStyle( fontSize: 18, color: Colors.black87 ),)
              ),
              SizedBox( height: 50 ),
            ],
          ),
        )
      )
   );
  }
}


class _RegisterForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final registerForm = Provider.of<RegisterFormProvider>(context);

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
                labelText: 'Nombre',
                prefixIcon: Icons.person
              ),
              onChanged: ( value ) => registerForm.nombreUsuario = value,
              validator: ( value ) {

                  String pattern = r'^[a-zA-z ]+$';
                  RegExp regExp  = RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Letras';

              },
            ),

             SizedBox( height: 30 ),

             TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.name,
              decoration: InputDecorations.authInputDecoration(
                hintText: '',
                labelText: 'Apellido',
                prefixIcon: Icons.person
              ),
              onChanged: ( value ) => registerForm.apellidoUsuario = value,
              validator: ( value ) {

                  String pattern =  r'^[a-zA-z ]+$';
                  RegExp regExp  =  RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Ingrese solo Letras';

              },
            ),
            
            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: ( value ) => registerForm.email = value,
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';

              },
            ),

            SizedBox( height: 30 ),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: ( value ) => registerForm.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';                                    
                  
              },
            ),

            SizedBox( height: 30 ),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Color.fromARGB(255, 255, 222, 173),
              elevation: 0,
              color: Color.fromRGBO(207, 166, 90, 1),
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text(
                  registerForm.isLoading 
                    ? 'Espere'
                    : 'Ingresar',
                  style: TextStyle( color: Colors.black, fontSize: 18 ),
                )
              ),
              onPressed: registerForm.isLoading ? null : () async {
                
                FocusScope.of(context).unfocus();

                final authService = Provider.of<AuthService>(context, listen: false);
                
                if( !registerForm.isValidForm() ) return;

                registerForm.isLoading = true;

                final String? errorMessage = await authService.createUser(registerForm.email, registerForm.password, registerForm.nombreUsuario, registerForm.apellidoUsuario);

                if ( errorMessage == null ) {
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  
                  print( errorMessage );
                  registerForm.isLoading = false;
                }
              }
            )

          ],
        ),
      ),
    );
  }
}