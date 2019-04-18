import 'package:flutter/material.dart';
import 'package:gameware/bloc/product_bloc.dart';
import 'package:gameware/models/product_model.dart';
import 'package:gameware/screens/product_form_screen.dart';

class ProductsPartial extends StatefulWidget {
  @override
  _ProductsPartialState createState() => _ProductsPartialState();
}

class _ProductsPartialState extends State<ProductsPartial> {
  ProductBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: StreamBuilder<List<Product>>(
          stream: _bloc.products,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator(
                backgroundColor: Colors.green,
              );
            }
            List<Product> products = snapshot.data as List<Product>;
            if (products.length == 0) {
              return Center(
                child: Text("No records to show."),
              );
            }
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                var product = products[index];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              product.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Código: ${product.toString()}',
                            style: TextStyle(
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.red[500],
                    ),
                    Text(product.toString()),
                    Divider(
                      height: 50.0,
                    )
                  ],
                );
              },
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductFormScreen()
          ));
        },
      ),
    );
  }

  @override
  initState() {
    _bloc = ProductBloc()..init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

}