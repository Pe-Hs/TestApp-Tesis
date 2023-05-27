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
      child: Center(
        child: Icon(
          Icons.bug_report,
          color: Colors.amber,
          size: 130,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   if(query.isEmpty){
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bug_report,
              color: Colors.black38,
              size: 130,
            ),
            Text('No hay Resultados por Mostrar')
          ],
        ),
      ),
    );
   }

    return _emptyContainer();

  }

}