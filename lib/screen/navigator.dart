import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ionicons/ionicons.dart';

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
        buttonBackgroundColor: Colors.lightGreen,
        animationCurve: Curves.easeInOutQuint,
        color: Colors.amber,
        items: [
          Icon(
            Ionicons.cart_outline,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Ionicons.home_outline,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Ionicons.person_outline,
            size: 30,
            color: Colors.white,
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
