import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:ionicons/ionicons.dart';

class CategoriaWidget extends StatelessWidget {
  const CategoriaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categorias',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _FilterIcon(Icon(Ionicons.color_fill_outline, size: 50,), 'Aderezo', Color.fromARGB(235, 209, 91, 91)),
              _FilterIcon(Icon(Ionicons.leaf_outline, size: 50,), 'Especias', Colors.lightGreen),
              _FilterIcon(Icon(Ionicons.fast_food_outline, size: 50,), 'Otros', Colors.amber)
            ],
          )
        ],
      ),
    );
  }

}

class _FilterIcon extends StatelessWidget {

  final Icon icon;
  final String filtername;
  final Color color;


  const _FilterIcon(this.icon, this.filtername, this.color);

  @override
  Widget build(BuildContext context) {

    final storage  = FlutterSecureStorage();


    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            boxShadow: [
              BoxShadow(
                offset: Offset(0,3),
                blurRadius: 2,
                spreadRadius: 1,
                color: Colors.black.withOpacity(0.2)
              )
            ]
          ),
          child: IconButton(
            iconSize: 60,
            color: Colors.white,
            icon: icon,
            onPressed: () {
              Navigator.pushNamed(context, filtername);
            },
          ),
        ),
        SizedBox(height: 10,),
        Text(
          filtername,
          style: TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}