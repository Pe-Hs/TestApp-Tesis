

import 'package:flutter/material.dart';
import 'package:login/services/producto_service.dart';
import 'package:login/widgets/search-bar.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoService>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          UserInfoBar(),
          SearchBar(),
          CategoriaWidget(),
        ],
      ),
    );
  }
}
