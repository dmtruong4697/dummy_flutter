import 'package:flutter/material.dart';
import 'package:namer_app/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {print("tap ${product.id}")},
      onDoubleTap: () => {print("double tap ${product.id}")},
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(
                width: 2, color: const Color.fromARGB(255, 255, 164, 194))),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 167, 72, 0)),
                product.title,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product.description,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Colors.amber,
                    height: 120,
                    width: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://cdn.mohinhcaocap.com/wp-content/uploads/2025/01/14172124/640-210x270.png")),
                    ),
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
