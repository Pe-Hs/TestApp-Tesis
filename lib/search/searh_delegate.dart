import 'package:flutter/material.dart';

class AppSearch extends SearchDelegate {

  @override

  String get searchFieldLabel => 'Buscar';

  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
     return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
     );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildActions');
  }

  Widget _emptyContainer(){
    return Container(
      
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

}