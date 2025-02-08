class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating,
      required this.category});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData["id"],
      title: jsonData["title"],
      price: (jsonData['price'] is num)
          ? (jsonData['price'] as num).toDouble()
          : 0.0,
      description: jsonData["description"],
      image: jsonData["image"],
      rating: jsonData["rating"] != null
          ? RatingModel.fromJson(jsonData["rating"])
          : RatingModel(rate: 0.0, count: 0), // Provide default values
      category: jsonData['category'],
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    if (jsonData == null) {
      return RatingModel(rate: 0.0, count: 0);
    }

    return RatingModel(
      rate: (jsonData["rate"] is num)
          ? (jsonData["rate"] as num).toDouble()
          : 0.0,
      count: jsonData["count"] ?? 0, // Provide a default value
    );
  }
}
