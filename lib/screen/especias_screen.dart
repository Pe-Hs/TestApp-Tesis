import 'package:flutter/material.dart';
import 'package:login/models/producto.dart';


class EspeciasScreen extends StatefulWidget {

  final List<Producto> productoEspecias;

  const EspeciasScreen({
    super.key,
    required this.productoEspecias
    });

  @override
  State<EspeciasScreen> createState() => _EspeciasScreenState();
}

class _EspeciasScreenState extends State<EspeciasScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            elevation: 8,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text('Especias'),
          ),
          body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65
            ),
            itemCount: widget.productoEspecias.length,
            itemBuilder: (context, index) {
              if(widget.productoEspecias.isEmpty){
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return _ListaEspecias(especias: widget.productoEspecias[index]);
            },
          ),
        ),
      ),
    );
  }
}

class _ListaEspecias extends StatelessWidget {

  final Producto especias;

  const _ListaEspecias({
    Key? key,
    required this.especias
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color textColor = especias.estado! == 'Disponible' ? Colors.green : Colors.red;

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {        
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 1.1,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no_image.jpg'),
                    image: NetworkImage(especias.getImgFromBack),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
                    children: [
                      Text(
                        especias.estado!,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textColor
                        ),
                      ),

                      Text(
                        'stock: ${especias.stock!}',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: size.width - 238),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          especias.nombreProducto!,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       Text(
                        'S/. ${especias.precioUnitario!} und.',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber
                        ),
                      ),
                    ],
                  ),
                   ElevatedButton(
                    onPressed: () {}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Añadir al Carrito',
                          style: TextStyle(
                            fontSize: 15
                          ),
                          )
                      ],
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}