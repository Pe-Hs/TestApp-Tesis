import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.black.withOpacity(0.05)
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(Ionicons.search_outline),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  border: InputBorder.none
                ),
              ),
            ),
          ),
          SizedBox(width: 10,),
          Icon(Ionicons.mic_outline, color: Colors.amber,),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}
