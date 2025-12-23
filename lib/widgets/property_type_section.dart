import 'package:flutter/material.dart';
import '../components/property_type_card.dart';

class PropertyTypeSection extends StatelessWidget {
  const PropertyTypeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 360;

    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse by property type',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          SizedBox(
            height: isSmallScreen ? 90 : 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PropertyTypeCard(icon: Icons.hotel, label: 'Hotels', isSmallScreen: isSmallScreen),
                SizedBox(width: isSmallScreen ? 8 : 12),
                PropertyTypeCard(icon: Icons.apartment, label: 'Apartments', isSmallScreen: isSmallScreen),
                SizedBox(width: isSmallScreen ? 8 : 12),
                PropertyTypeCard(icon: Icons.beach_access, label: 'Resorts', isSmallScreen: isSmallScreen),
                SizedBox(width: isSmallScreen ? 8 : 12),
                PropertyTypeCard(icon: Icons.house, label: 'Villas', isSmallScreen: isSmallScreen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}