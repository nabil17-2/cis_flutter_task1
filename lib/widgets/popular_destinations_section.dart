import 'package:flutter/material.dart';

class PopularDestinationsSection extends StatelessWidget {
  const PopularDestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 360;

    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular with travelers from Bangladesh',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          Text(
            'Domestic',
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isSmallScreen ? 6 : 8),
          Wrap(
            spacing: isSmallScreen ? 8 : 12,
            runSpacing: isSmallScreen ? 6 : 8,
            children: const [
              _DestinationLink(text: 'Cox\'s Bazar hotels'),
              _DestinationLink(text: 'Chittagong hotels'),
              _DestinationLink(text: 'Sylhet hotels'),
              _DestinationLink(text: 'Khulna hotels'),
              _DestinationLink(text: 'Khuina hotels'),
              _DestinationLink(text: 'Mymensingh hotels'),
              _DestinationLink(text: 'Rajshahi hotels'),
              _DestinationLink(text: 'Saidpur hotels'),
            ],
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          Text(
            'International',
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isSmallScreen ? 6 : 8),
          Wrap(
            spacing: isSmallScreen ? 8 : 12,
            runSpacing: isSmallScreen ? 6 : 8,
            children: const [
              _DestinationLink(text: 'Malaysia'),
              _DestinationLink(text: 'Thailand'),
              _DestinationLink(text: 'India'),
              _DestinationLink(text: 'UAE'),
              _DestinationLink(text: 'Turkey'),
              _DestinationLink(text: 'Qatar'),
              _DestinationLink(text: 'UK'),
              _DestinationLink(text: 'USA'),
            ],
          ),
        ],
      ),
    );
  }
}

class _DestinationLink extends StatelessWidget {
  final String text;

  const _DestinationLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF0071C2),
          fontSize: 14,
        ),
      ),
    );
  }
}