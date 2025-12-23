import 'package:flutter/material.dart';
import '../components/property_card.dart';

class HomeGuestsSection extends StatelessWidget {
  const HomeGuestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    final List<Map<String, dynamic>> properties = [
      {
        'name': 'Apartheid Stare Miasto',
        'location': 'Old Town, Poland, Krakow',
        'distance': '2,275 m from center',
        'rating': '9.1',
        'price': 'BOT 15,381',
      },
      {
        'name': 'YSeasons Apartments Budapest',
        'location': '96. Homok, Hungary, Budapest',
        'distance': '104.61 m from center',
        'rating': '9.6',
        'price': 'BOT 22,905',
      },
      {
        'name': 'The Apartments by The Sloane Club',
        'location': 'Kensington and Chelsea, United Kingdom, London',
        'distance': '247 metres',
        'rating': '9.4',
        'price': 'BOT 63,623',
      },
      {
        'name': 'Cheval Three Quays at The Tower of London',
        'location': 'City of London, United Kingdom, London',
        'distance': '750 metres',
        'rating': '9.5',
        'price': 'BOT 65,338',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth < 360 ? 12 : 20,
        vertical: screenWidth < 360 ? 16 : 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Home guests love',
            style: TextStyle(
              fontSize: screenWidth < 360 ? 20 : 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),

          SizedBox(height: screenWidth < 360 ? 12 : 16),

          Text(
            'Discover properties loved by our guests',
            style: TextStyle(
              fontSize: screenWidth < 360 ? 14 : 16,
              color: const Color(0xFF666666),
            ),
          ),

          SizedBox(height: screenWidth < 360 ? 20 : 24),


          SizedBox(
            height: _getPropertyCardHeight(screenWidth),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: properties.length,
              separatorBuilder: (context, index) =>
                  SizedBox(width: screenWidth < 360 ? 12 : 16),
              itemBuilder: (context, index) {
                final property = properties[index];
                return PropertyCard(
                  propertyName: property['name'] as String,
                  location: property['location'] as String,
                  distance: property['distance'] as String,
                  rating: property['rating'] as String,
                  price: property['price'] as String,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double _getPropertyCardHeight(double screenWidth) {
    if (screenWidth < 360) return 460;
    if (screenWidth < 400) return 470;
    if (screenWidth < 500) return 480;
    if (screenWidth < 600) return 490;
    if (screenWidth < 800) return 500;
    return 520;
  }
}