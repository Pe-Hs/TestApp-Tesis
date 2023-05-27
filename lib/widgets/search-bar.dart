import 'package:flutter/material.dart';
import 'package:login/search/searh_delegate.dart';

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
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 50,
              color: Colors.amberAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.search,
                    color: Color.fromRGBO(126, 130, 153, 1),
                  ),
                  GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: AppSearch());
                    },
                    child: Container(
                      width: 250,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mic),
                      color: Color.fromRGBO(126, 130, 153, 1)),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            ),
          ),                  
        ],
      ),
    );
  }
}
