import 'package:flutter/material.dart';
import '../components/destination_card.dart';

class TrendingDestinationsSection extends StatelessWidget {
  const TrendingDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 360;

    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trending destinations',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isSmallScreen ? 4 : 8),
          Text(
            'Most popular choices for travelers from Bangladesh',
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
              color: const Color(0xFF666666),
            ),
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          SizedBox(
            height: isSmallScreen ? 90 : 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DestinationCard(city: 'Kuala Lumpur', flag: '🇲🇾', isSmallScreen: isSmallScreen),
                SizedBox(width: isSmallScreen ? 8 : 12),
                DestinationCard(city: 'Bangkok', flag: '🇹🇭', isSmallScreen: isSmallScreen),
                SizedBox(width: isSmallScreen ? 8 : 12),
                DestinationCard(city: 'Cox\'s Bazar', flag: '🇧🇩', isSmallScreen: isSmallScreen),
                SizedBox(width: isSmallScreen ? 8 : 12),
                DestinationCard(city: 'Dhaka', flag: '🇧🇩', isSmallScreen: isSmallScreen),
                SizedBox(width: isSmallScreen ? 8 : 12),
                DestinationCard(city: 'Singapore', flag: '🇸🇬', isSmallScreen: isSmallScreen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}