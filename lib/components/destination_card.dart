import 'package:flutter/material.dart';
import '../constants/colors.dart';

class DestinationCard extends StatelessWidget {
  final String city;
  final String flag;
  final bool isSmallScreen;

  const DestinationCard({
    required this.city,
    required this.flag,
    this.isSmallScreen = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmallScreen ? 100 : 120,
      padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightGrayBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(flag, style: TextStyle(fontSize: isSmallScreen ? 20 : 24)),
          SizedBox(height: isSmallScreen ? 6 : 8),
          Text(
            city,
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}