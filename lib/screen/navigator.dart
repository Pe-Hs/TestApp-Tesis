import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login/screen/home.dart';
import 'package:login/screen/user-account.dart';
import 'package:login/screen/productos_screen.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({super.key});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  int _activePage = 1;

  @override
  Widget build(BuildContext context) {

    final List<Widget> _tabItems = [
      ProductosList(),
      MainScreen(),
      UserAccount(),
    ];

    return Scaffold(
      body: _tabItems[_activePage],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        index: 1,
        backgroundColor: Colors.white,
        color: Colors.amber,
        items: [
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.account_circle_sharp,
            size: 30,
            color: Colors.black,
          )
        ],
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
    );
  }
}
