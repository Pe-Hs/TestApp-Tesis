import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String nombreUsuario = '';
  String apellidoUsuario = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm(){
    print(formkey.currentState?.validate());
    print('$email - $password');
    return formkey.currentState?.validate() ?? false;
  }

}