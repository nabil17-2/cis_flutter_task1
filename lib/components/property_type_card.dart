import 'package:flutter/material.dart';
import '../constants/colors.dart';

class PropertyTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSmallScreen;

  const PropertyTypeCard({
    required this.icon,
    required this.label,
    this.isSmallScreen = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmallScreen ? 70 : 80,
      padding: EdgeInsets.all(isSmallScreen ? 8 : 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.lightGrayBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: isSmallScreen ? 28 : 32,
            color: AppColors.secondaryBlue,
          ),
          SizedBox(height: isSmallScreen ? 6 : 8),
          Text(
            label,
            style: TextStyle(
              fontSize: isSmallScreen ? 10 : 12,
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