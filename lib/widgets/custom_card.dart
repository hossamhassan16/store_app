import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.product,
    super.key,
  });
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 0),
                spreadRadius: 0,
              ),
            ]),
            child: Card(
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title.substring(0, 15),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r"$" "${product.price.toString()}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 30,
            bottom: 95,
            child: Image.network(
              product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
