import 'dart:convert';

class Meal {
  final int id;
  final String name;
  final String image;
  final int categoryId;
  final num price;
  final String components;
  final int newSign;
  final int featured;
  final int order;
  final String createdAt;

  Meal({
    required this.id,
    required this.name,
    required this.image,
    required this.categoryId,
    required this.price,
    required this.components,
    required this.newSign,
    required this.featured,
    required this.order,
    required this.createdAt,
  });

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] as int,
      name: map['name'] ?? "",
      image: map['image'] ?? "",
      categoryId: map['category_id'] ?? "",
      price: map['price'] ?? "",
      components: map['components'] ?? "",
      newSign: map['new_sign'] ?? "",
      featured: map['featured'] ?? "",
      order: map['order'] ?? "",
      createdAt: map['created_at'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'category_id': categoryId,
      'price': price,
      'components': components,
      'new_sign': newSign,
      'featured': featured,
      'order': order,
    };
  }

  factory Meal.fromJson(String source) =>
      Meal.fromMap(json.decode(source) as Map<String, dynamic>);
}
