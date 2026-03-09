import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/mock_data.dart';
import '../models/band.dart';
import '../theme/app_theme.dart';
import 'restaurant_detail_page.dart';

class BandPage extends StatelessWidget {
  const BandPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bands = MockData.getBands();
    final now = DateTime.now();

    // Group bands by date
    final todayBands = bands
        .where(
          (b) =>
              b.performanceTime.day == now.day &&
              b.performanceTime.month == now.month,
        )
        .toList();

    final tomorrowBands = bands
        .where(
          (b) =>
              b.performanceTime.day == now.day + 1 ||
              (now.day == DateTime(now.year, now.month + 1, 0).day &&
                  b.performanceTime.day == 1),
        )
        .toList();

    final upcomingBands = bands
        .where((b) => b.performanceTime.day > now.day + 1)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Live Music')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.purple.withValues(alpha: 0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 32,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Live Music Schedule',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enjoy live performances at your favorite restaurants',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),

            // Today's Performances
            if (todayBands.isNotEmpty) ...[
              _buildSectionHeader(context, "Tonight", Colors.orange),
              _buildBandList(context, todayBands, true),
            ],

            // Tomorrow's Performances
            if (tomorrowBands.isNotEmpty) ...[
              _buildSectionHeader(context, "Tomorrow", Colors.blue),
              _buildBandList(context, tomorrowBands, false),
            ],

            // Upcoming Performances
            if (upcomingBands.isNotEmpty) ...[
              _buildSectionHeader(context, "Upcoming", Colors.green),
              _buildBandList(context, upcomingBands, false),
            ],

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBandList(BuildContext context, List<Band> bands, bool isToday) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: bands.length,
      itemBuilder: (context, index) {
        return BandCard(band: bands[index], isToday: isToday);
      },
    );
  }
}

class BandCard extends StatelessWidget {
  final Band band;
  final bool isToday;

  const BandCard({super.key, required this.band, required this.isToday});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          final restaurants = MockData.getRestaurants();
          final restaurant = restaurants.firstWhere(
            (r) => r.id == band.restaurantId,
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
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Band Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: band.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[300],
                    child: const Icon(Icons.music_note),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Band Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Band Name
                    Text(
                      band.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Genre
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: _getGenreColor(band.genre),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        band.genre,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Restaurant & Time
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: AppTheme.primaryColor,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            band.restaurantName,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppTheme.primaryColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: isToday ? Colors.orange : Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatTime(band.performanceTime),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: isToday ? Colors.orange : Colors.grey,
                                fontWeight: isToday ? FontWeight.bold : null,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Arrow
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Color _getGenreColor(String genre) {
    switch (genre.toLowerCase()) {
      case 'rock':
        return Colors.red;
      case 'jazz':
        return Colors.blue;
      case 'blues':
        return Colors.brown;
      case 'acoustic':
        return Colors.green;
      default:
        return Colors.purple;
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}
