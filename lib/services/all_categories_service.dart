import 'package:store_app/helpers/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: "https://fakestoreapi.com/products/categories");
    return data;
  }
}
