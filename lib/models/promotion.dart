enum PromotionType { beer, food, special, discount }

class Promotion {
  final String id;
  final String title;
  final String description;
  final String discountDetail;
  final String imageUrl;
  final String restaurantId;
  final String restaurantName;
  final PromotionType type;
  final DateTime validUntil;

  Promotion({
    required this.id,
    required this.title,
    required this.description,
    required this.discountDetail,
    required this.imageUrl,
    required this.restaurantId,
    required this.restaurantName,
    required this.type,
    required this.validUntil,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'discountDetail': discountDetail,
      'imageUrl': imageUrl,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'type': type.name,
      'validUntil': validUntil.toIso8601String(),
    };
  }

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      discountDetail: json['discountDetail'] as String,
      imageUrl: json['imageUrl'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      type: PromotionType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => PromotionType.discount,
      ),
      validUntil: DateTime.parse(json['validUntil'] as String),
    );
  }
}
