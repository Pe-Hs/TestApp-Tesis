import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login/screen/aderezos_screen.dart';
import 'package:login/screen/especias_screen.dart';
import 'package:login/screen/login_screen.dart';
import 'package:login/screen/navigator.dart';
import 'package:login/screen/otros_screen.dart';
import 'package:login/screen/register_screen.dart';
import 'package:login/services/auth_service.dart';
import 'package:login/services/carrito_service.dart';
import 'package:login/services/notification_service.dart';
import 'package:login/services/producto_service.dart';
import 'package:login/services/user_Service.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]).then((value) => runApp(AppState()));

  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService(),),      
        // ChangeNotifierProvider(create: (_) => UserService(), lazy: false),
        ChangeNotifierProvider(create: (_) => ProductoService(),  lazy: false),
        ChangeNotifierProvider(create: (_) => CarritoService(),) 
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final productoProvider = Provider.of<ProductoService>(context);

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
        'login' :    (_) => LoginPage(),
        'home' :     (_) => NavigatorBar(),
        'register' : (_) => RegisterScreen(),
        'Aderezo'  : (_) => AderezoScreen(productoAderezo: productoProvider.productoAderezo),
        'Especias' : (_) => EspeciasScreen(productoEspecias: productoProvider.productoEspecias,),
        'Otros'    : (_) => OtrosScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}