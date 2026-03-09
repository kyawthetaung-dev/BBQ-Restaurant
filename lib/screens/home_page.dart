import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/mock_data.dart';
import '../models/promotion.dart';
import '../theme/app_theme.dart';
import 'restaurant_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final promotions = MockData.getPromotions();

    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Menu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColor.withValues(alpha: 0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to E-Menu',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Discover amazing deals and promotions',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Today's Special Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Today's Special",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            // Promotions Grid
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: promotions.length,
              itemBuilder: (context, index) {
                return PromotionCard(
                  promotion: promotions[index],
                  onTap: () {
                    final restaurants = MockData.getRestaurants();
                    final restaurant = restaurants.firstWhere(
                      (r) => r.id == promotions[index].restaurantId,
                      orElse: () => restaurants.first,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RestaurantDetailPage(restaurant: restaurant),
                      ),
                    );
                  },
                );
              },
            ),

            const SizedBox(height: 16),

            // Quick Categories
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Quick Categories',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CategoryCard(
                      icon: Icons.local_bar,
                      title: 'Beer',
                      color: Colors.amber,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CategoryCard(
                      icon: Icons.restaurant,
                      title: 'BBQ',
                      color: Colors.red,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CategoryCard(
                      icon: Icons.music_note,
                      title: 'Live Music',
                      color: Colors.purple,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final Promotion promotion;
  final VoidCallback onTap;

  const PromotionCard({
    super.key,
    required this.promotion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promotion Image
            SizedBox(
              height: 150,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: promotion.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                ),
              ),
            ),

            // Promotion Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getPromotionColor(promotion.type),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _getPromotionTypeText(promotion.type),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Title
                  Text(
                    promotion.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),

                  const SizedBox(height: 4),

                  // Restaurant Name
                  Text(
                    promotion.restaurantName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    promotion.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 12),

                  // Discount & View Button
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.accentColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            promotion.discountDetail,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: onTap,
                        child: const Text('View Shop'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getPromotionColor(PromotionType type) {
    switch (type) {
      case PromotionType.beer:
        return Colors.amber[700]!;
      case PromotionType.food:
        return Colors.red;
      case PromotionType.special:
        return AppTheme.primaryColor;
      case PromotionType.discount:
        return Colors.green;
    }
  }

  String _getPromotionTypeText(PromotionType type) {
    switch (type) {
      case PromotionType.beer:
        return '🍺 Beer';
      case PromotionType.food:
        return '🍗 Food';
      case PromotionType.special:
        return '⭐ Special';
      case PromotionType.discount:
        return '🏷️ Discount';
    }
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(height: 8),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
