import 'package:flutter/material.dart';
import 'package:gameware/screens/product_form_screen.dart';

class ProductsPartial extends StatelessWidget {
  final sampleList = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(10.0),
        child: new ListView.builder(
          itemCount: sampleList.length,
          itemBuilder: (BuildContext context, int index) {
            var product = sampleList[index];

            return new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Container(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: new Text(
                          product.toString(),
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      new Text(
                        'Código: ${product.toString()}',
                        style: new TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                new Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                new Text(product.toString()),
                new Divider(
                  height: 50.0,
                )
              ],
            );
          },
        )
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(
            builder: (context) => new ProductFormScreen()
          ));
        },
      ),
    );
  }

}