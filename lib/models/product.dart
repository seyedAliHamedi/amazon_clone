// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<String> imageUrls;
  final String? id;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.imageUrls,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'imageUrls': imageUrls,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      price: map['price'] ?? 0.0,
      quantity: map['quantity'] ?? 0.0,
      category: map['category'] ?? "",
      imageUrls: map['imageUrls'] ?? [],
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
