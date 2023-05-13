import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 70,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox( width: 20,),
                  Icon(
                    Icons.search,
                    color: Color.fromRGBO(126, 130, 153, 1),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}