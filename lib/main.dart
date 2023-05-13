import 'package:flutter/material.dart';
import 'package:login/screen/login_screen.dart';
import 'package:login/screen/navigator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData( color: Colors.black),
          color: Colors.amber
        )
      ),
      title: 'Login ',
      initialRoute: 'login',
      routes: {
        'login' :  (_) => LoginPage(),
        'home' :  (_) => NavigatorBar(),
      },
    );
  }
}