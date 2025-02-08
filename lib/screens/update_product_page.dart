import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "update product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Product",
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onChanged: (data) {
                  name = data;
                },
                hintText: "Product Name",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  description = data;
                },
                hintText: "description",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
                hintText: "price",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hintText: "image",
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                text: "Update",
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  try {
                    await UpdateProduct(product);
                    print("success");
                  } catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> UpdateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: name == null ? product.title : name!,
        price: price == null ? (product.price).toString() : price!,
        description: description == null ? product.description : description!,
        category: product.category,
        image: image == null ? product.image : image!);
  }
}
