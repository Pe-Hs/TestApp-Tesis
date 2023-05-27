import 'package:flutter/material.dart';
import 'package:login/widgets/search-bar.dart';

import '../widgets/categorias-widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,      
      body: ListView(
        children: [
          SearchBar(),
          CategoriaWidget(),
          
        ],
      ),
    );
  }
}