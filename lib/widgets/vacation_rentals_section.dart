import 'package:flutter/material.dart';
import '../constants/colors.dart';

class VacationRentalsSection extends StatelessWidget {
  const VacationRentalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 360;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmallScreen ? 20 : 30),
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: [
          Text(
            'Want to feel at home on your next adventure?',
            style: TextStyle(
              fontSize: isSmallScreen ? 18 : 22,
              fontWeight: FontWeight.w700,
              color: Colors.black,

            ),
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          SizedBox(
            width: isSmallScreen ? 180 : 200,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryBlue,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 12 : 14,
                  horizontal: isSmallScreen ? 16 : 24,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Text(
                'Discover vacation rentals',
                style: TextStyle(
                  fontSize: isSmallScreen ? 14 : 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}