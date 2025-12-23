import 'package:flutter/material.dart';
import '../constants/colors.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: AppColors.primaryBlue,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildSearchField(
              icon: Icons.search,
              text: 'Where are you going?',
            ),
            const SizedBox(height: 10),
            _buildSearchField(
              icon: Icons.calendar_today,
              text: 'Check in date — Check-out date',
            ),
            const SizedBox(height: 10),
            _buildSearchField(
              icon: Icons.person_outline,
              text: '2 adults · 0 children · 1 room',
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryBlue,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.lightGrayBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gray),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: AppColors.gray,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}