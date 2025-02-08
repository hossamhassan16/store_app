import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartShopping),
          ),
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "New Trend",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 90,
        ),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 90,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(product: products[index]);
                },
              );
            } else {
              return Center(child: Text("No products available"));
            }
          },
        ),
      ),
    );
  }
}
