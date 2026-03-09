class Band {
  final String id;
  final String name;
  final String imageUrl;
  final String restaurantId;
  final String restaurantName;
  final DateTime performanceTime;
  final String genre;

  Band({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.restaurantId,
    required this.restaurantName,
    required this.performanceTime,
    required this.genre,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'performanceTime': performanceTime.toIso8601String(),
      'genre': genre,
    };
  }

  factory Band.fromJson(Map<String, dynamic> json) {
    return Band(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      performanceTime: DateTime.parse(json['performanceTime'] as String),
      genre: json['genre'] as String,
    );
  }
}
