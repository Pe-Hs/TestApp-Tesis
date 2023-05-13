import 'package:flutter/material.dart';

import '../widgets/categorias-widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

      ),
      child: ListView(
        children: [
          CategoriaWidget(),
        ],
      ),
    );
  }
}