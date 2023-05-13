import 'package:flutter/material.dart';

import 'package:login/screen/login_screen.dart';

class CategoriaWidget extends StatelessWidget {
  const CategoriaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      padding: EdgeInsets.only(top: 30, right: 10, left: 10),
      height: 200,         
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Categorias',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )),
          SizedBox( height: 10,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox( width: 15,),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return _CategoriaSlider(index);
              },
            ),
          )
        ],
      )
    );
  }

  void _logout(BuildContext context) async {
    // final storage = FlutterSecureStorage();
    // await storage.delete(key: 'token');

     Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

class _CategoriaSlider extends StatelessWidget {
  
  final int nro;

  const _CategoriaSlider(this.nro);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 90,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                placeholder: AssetImage('assets/no_image.jpg'),
                image: NetworkImage('https://picsum.photos/seed/${(nro*8)-8}/200/300'),
                height: 70,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Text('Categ.0$nro')
        ],
      ),
    );
  }
}