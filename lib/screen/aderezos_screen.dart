import 'package:flutter/material.dart';
import 'package:login/models/producto.dart';

class AderezoScreen extends StatefulWidget {
  final List<Producto> productoAderezo;

  const AderezoScreen({super.key, required this.productoAderezo});

  @override
  State<AderezoScreen> createState() => _AderezoScreenState();
}

class _AderezoScreenState extends State<AderezoScreen> {
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
  }

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
            title: Text('Aderezos'),
          ),
          body: RefreshIndicator(
            onRefresh: onRefresh,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.65),
              itemCount: widget.productoAderezo.length,
              itemBuilder: (context, index) {
                if (widget.productoAderezo.isEmpty) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return _ListaAderezos(aderezo: widget.productoAderezo[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ListaAderezos extends StatelessWidget {
  final Producto aderezo;

  const _ListaAderezos({Key? key, required this.aderezo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor =
        aderezo.estado! == 'Disponible' ? Colors.green : Colors.red;

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {},
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
                    image: NetworkImage(aderezo.getImgFromBack),
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
                        aderezo.estado!,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: textColor),
                      ),
                      Text(
                        'stock: ${aderezo.stock!}',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
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
                          aderezo.nombreProducto!,
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'S/. ${aderezo.precioUnitario!} und.',
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print(aderezo.id);
                    }, 
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
