import 'menu_item.dart';
import 'review.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String coverImageUrl;
  final double rating;
  final String address;
  final String phone;
  final String type; // BBQ, Beer, Food
  final List<MenuItem> menuItems;
  final List<Review> reviews;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.coverImageUrl,
    required this.rating,
    required this.address,
    required this.phone,
    required this.type,
    required this.menuItems,
    required this.reviews,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'coverImageUrl': coverImageUrl,
      'rating': rating,
      'address': address,
      'phone': phone,
      'type': type,
      'menuItems': menuItems.map((e) => e.toJson()).toList(),
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      coverImageUrl: json['coverImageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      address: json['address'] as String,
      phone: json['phone'] as String,
      type: json['type'] as String,
      menuItems: (json['menuItems'] as List)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
