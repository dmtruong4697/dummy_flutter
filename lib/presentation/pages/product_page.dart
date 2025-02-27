import 'package:flutter/material.dart';
import 'package:namer_app/data/models/product_model.dart';

class ProductPage extends StatefulWidget {
  @override
  final int id;
  const ProductPage({super.key, required this.id});
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductModel product;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product detail"),
      ),
      body: Text("${widget.id}"),
    );
  }
}
