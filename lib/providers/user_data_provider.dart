import 'package:flutter/material.dart';

class UserDataFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String password = '';
  String nombreUsuario = '';
  String apellidoUsuario = '';
  String direccion = '';
  String ciudad = '';
  String departamento = '';
  String distrito = '';
  String nroCelular = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){
    print(formkey.currentState?.validate());
    print('$nombreUsuario - $apellidoUsuario');
    return formkey.currentState?.validate() ?? false;
  }

}