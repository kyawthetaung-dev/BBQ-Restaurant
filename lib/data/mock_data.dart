import '../models/restaurant.dart';
import '../models/menu_item.dart';
import '../models/review.dart';
import '../models/promotion.dart';
import '../models/band.dart';

class MockData {
  static List<MenuItem> getMenuItems() {
    return [
      // BBQ Menu Items
      MenuItem(
        id: '1',
        name: 'BBQ Pork',
        description: 'Grilled pork with special BBQ sauce',
        price: 6.00,
        imageUrl:
            'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=400',
        category: 'BBQ',
      ),
      MenuItem(
        id: '2',
        name: 'BBQ Chicken',
        description: 'Juicy grilled chicken with herbs',
        price: 7.50,
        imageUrl:
            'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=400',
        category: 'BBQ',
      ),
      MenuItem(
        id: '3',
        name: 'Beef Ribs',
        description: 'Tender beef ribs with spice rub',
        price: 12.00,
        imageUrl:
            'https://images.unsplash.com/photo-1544025162-d76694265947?w=400',
        category: 'BBQ',
      ),
      // Beer Menu Items
      MenuItem(
        id: '4',
        name: 'Local Beer',
        description: 'Fresh local draft beer',
        price: 2.00,
        imageUrl:
            'https://images.unsplash.com/photo-1535958636474-b021ee887b13?w=400',
        category: 'Beer',
      ),
      MenuItem(
        id: '5',
        name: 'Craft Beer',
        description: 'Various craft beer selection',
        price: 4.00,
        imageUrl:
            'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400',
        category: 'Beer',
      ),
      MenuItem(
        id: '6',
        name: 'Beer Tower',
        description: '1L beer tower',
        price: 8.00,
        imageUrl:
            'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=400',
        category: 'Beer',
      ),
      // Food Menu Items
      MenuItem(
        id: '7',
        name: 'Fried Chicken',
        description: 'Crispy fried chicken',
        price: 4.00,
        imageUrl:
            'https://images.unsplash.com/photo-1626645738196-c2a7c87a8f58?w=400',
        category: 'Food',
      ),
      MenuItem(
        id: '8',
        name: 'French Fries',
        description: 'Crispy golden fries',
        price: 2.50,
        imageUrl:
            'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=400',
        category: 'Food',
      ),
      MenuItem(
        id: '9',
        name: 'Onion Rings',
        description: 'Crispy battered onion rings',
        price: 3.00,
        imageUrl:
            'https://images.unsplash.com/photo-1639024471283-03518883512d?w=400',
        category: 'Food',
      ),
    ];
  }

  static List<Review> getReviews() {
    return [
      Review(
        id: '1',
        userName: 'John D.',
        rating: 4.5,
        comment: 'Great BBQ! Best in town.',
        date: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Review(
        id: '2',
        userName: 'Sarah M.',
        rating: 5.0,
        comment: 'Amazing beer selection and live music!',
        date: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Review(
        id: '3',
        userName: 'Mike R.',
        rating: 4.0,
        comment: 'Good food, nice atmosphere.',
        date: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
  }

  static List<Restaurant> getRestaurants() {
    final menuItems = getMenuItems();
    final reviews = getReviews();

    return [
      Restaurant(
        id: '1',
        name: 'BBQ Garden',
        description: 'The best BBQ in town with authentic smokehouse recipes',
        imageUrl:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400',
        coverImageUrl:
            'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=800',
        rating: 4.5,
        address: '123 BBQ Street',
        phone: '+1 234-567-8901',
        type: 'BBQ',
        menuItems: menuItems.where((m) => m.category == 'BBQ').toList(),
        reviews: reviews,
      ),
      Restaurant(
        id: '2',
        name: 'Beer House',
        description: 'Craft beers and delicious pub food',
        imageUrl:
            'https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=400',
        coverImageUrl:
            'https://images.unsplash.com/photo-1535958636474-b021ee887b13?w=800',
        rating: 4.8,
        address: '456 Beer Avenue',
        phone: '+1 234-567-8902',
        type: 'Beer',
        menuItems: menuItems.where((m) => m.category == 'Beer').toList(),
        reviews: reviews,
      ),
      Restaurant(
        id: '3',
        name: 'Smokin Grill',
        description: 'Premium smoked meats and great drinks',
        imageUrl:
            'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?w=400',
        coverImageUrl:
            'https://images.unsplash.com/photo-1544025162-d76694265947?w=800',
        rating: 4.3,
        address: '789 Grill Road',
        phone: '+1 234-567-8903',
        type: 'BBQ',
        menuItems: menuItems.where((m) => m.category == 'BBQ').toList(),
        reviews: reviews,
      ),
      Restaurant(
        id: '4',
        name: 'Wings & Beer',
        description: 'Best wings with ice cold beer',
        imageUrl:
            'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400',
        coverImageUrl:
            'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=800',
        rating: 4.6,
        address: '321 Wings Lane',
        phone: '+1 234-567-8904',
        type: 'Beer',
        menuItems: [
          ...menuItems.where((m) => m.category == 'Beer'),
          ...menuItems.where((m) => m.category == 'Food'),
        ],
        reviews: reviews,
      ),
      Restaurant(
        id: '5',
        name: 'The Smoke Pit',
        description: 'Authentic pit BBQ with live music',
        imageUrl:
            'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400',
        coverImageUrl:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=800',
        rating: 4.7,
        address: '555 Smoke Street',
        phone: '+1 234-567-8905',
        type: 'BBQ',
        menuItems: menuItems.where((m) => m.category == 'BBQ').toList(),
        reviews: reviews,
      ),
      Restaurant(
        id: '6',
        name: 'Craft Corner',
        description: 'Artisan beers and gourmet burgers',
        imageUrl:
            'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=400',
        coverImageUrl:
            'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=800',
        rating: 4.4,
        address: '678 Craft Boulevard',
        phone: '+1 234-567-8906',
        type: 'Beer',
        menuItems: menuItems.where((m) => m.category == 'Beer').toList(),
        reviews: reviews,
      ),
    ];
  }

  static List<Promotion> getPromotions() {
    return [
      Promotion(
        id: '1',
        title: 'Beer 2 + 1 Free',
        description: 'Buy 2 beers get 1 free!',
        discountDetail: 'Get a free beer with every 2 purchased',
        imageUrl:
            'https://images.unsplash.com/photo-1535958636474-b021ee887b13?w=400',
        restaurantId: '2',
        restaurantName: 'Beer House',
        type: PromotionType.beer,
        validUntil: DateTime.now().add(const Duration(days: 7)),
      ),
      Promotion(
        id: '2',
        title: 'BBQ Chicken 50% OFF',
        description: 'Half price on BBQ Chicken today!',
        discountDetail: '50% OFF on all BBQ Chicken orders',
        imageUrl:
            'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=400',
        restaurantId: '1',
        restaurantName: 'BBQ Garden',
        type: PromotionType.food,
        validUntil: DateTime.now().add(const Duration(days: 3)),
      ),
      Promotion(
        id: '3',
        title: 'Special Menu of the Day',
        description: 'Chef\'s special BBQ platter',
        discountDetail: 'Special combo at special price',
        imageUrl:
            'https://images.unsplash.com/photo-1544025162-d76694265947?w=400',
        restaurantId: '3',
        restaurantName: 'Smokin Grill',
        type: PromotionType.special,
        validUntil: DateTime.now().add(const Duration(days: 1)),
      ),
      Promotion(
        id: '4',
        title: 'Happy Hour Beer',
        description: '50% off all beers from 4-7 PM',
        discountDetail: 'Half price beers during happy hour',
        imageUrl:
            'https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400',
        restaurantId: '4',
        restaurantName: 'Wings & Beer',
        type: PromotionType.beer,
        validUntil: DateTime.now().add(const Duration(days: 5)),
      ),
      Promotion(
        id: '5',
        title: 'Family BBQ Pack',
        description: 'Feed the whole family',
        discountDetail: '20% OFF on family packs',
        imageUrl:
            'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400',
        restaurantId: '5',
        restaurantName: 'The Smoke Pit',
        type: PromotionType.discount,
        validUntil: DateTime.now().add(const Duration(days: 10)),
      ),
      Promotion(
        id: '6',
        title: 'Craft Beer Festival',
        description: 'Try our limited edition craft beers',
        discountDetail: 'Buy 1 get 1 free on craft beers',
        imageUrl:
            'https://images.unsplash.com/photo-1559526324-4b87b5e36e44?w=400',
        restaurantId: '6',
        restaurantName: 'Craft Corner',
        type: PromotionType.beer,
        validUntil: DateTime.now().add(const Duration(days: 14)),
      ),
    ];
  }

  static List<Band> getBands() {
    final now = DateTime.now();
    return [
      Band(
        id: '1',
        name: 'Fire Band',
        imageUrl:
            'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=400',
        restaurantId: '1',
        restaurantName: 'BBQ Garden',
        performanceTime: DateTime(now.year, now.month, now.day, 19, 0),
        genre: 'Rock',
      ),
      Band(
        id: '2',
        name: 'Night Vibes',
        imageUrl:
            'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=400',
        restaurantId: '2',
        restaurantName: 'Beer House',
        performanceTime: DateTime(now.year, now.month, now.day, 20, 0),
        genre: 'Jazz',
      ),
      Band(
        id: '3',
        name: 'The Blues Brothers',
        imageUrl:
            'https://images.unsplash.com/photo-1511735111819-9a3f7709049c?w=400',
        restaurantId: '3',
        restaurantName: 'Smokin Grill',
        performanceTime: DateTime(now.year, now.month, now.day, 21, 0),
        genre: 'Blues',
      ),
      Band(
        id: '4',
        name: 'Acoustic Dreams',
        imageUrl:
            'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=400',
        restaurantId: '5',
        restaurantName: 'The Smoke Pit',
        performanceTime: DateTime(now.year, now.month, now.day + 1, 19, 0),
        genre: 'Acoustic',
      ),
      Band(
        id: '5',
        name: 'Jazz Ensemble',
        imageUrl:
            'https://images.unsplash.com/photo-1415201364774-f6f0bb35f28f?w=400',
        restaurantId: '6',
        restaurantName: 'Craft Corner',
        performanceTime: DateTime(now.year, now.month, now.day + 1, 20, 0),
        genre: 'Jazz',
      ),
      Band(
        id: '6',
        name: 'Rock Legends',
        imageUrl:
            'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?w=400',
        restaurantId: '4',
        restaurantName: 'Wings & Beer',
        performanceTime: DateTime(now.year, now.month, now.day + 2, 21, 0),
        genre: 'Rock',
      ),
    ];
  }
}
