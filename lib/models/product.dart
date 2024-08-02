// lib/models/product.dart
class Product {
  final String name;
  final String description;
  final String image;
  final String category;
  final double price;
  final String unit;
  final double rating;

  const Product({
    required this.name,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
    required this.unit,
    required this.rating,
  });
}
