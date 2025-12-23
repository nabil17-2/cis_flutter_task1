import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 360;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
      color: const Color(0xFFF5F5F5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support • Discover • Terms and settings • Partners • About',
            style: TextStyle(
              fontSize: isSmallScreen ? 10 : 12,
              color: const Color(0xFF666666),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 16 : 20),
          Wrap(
            spacing: isSmallScreen ? 16 : 24,
            runSpacing: isSmallScreen ? 16 : 20,
            children: [
              FooterColumn(
                title: 'Support',
                items: const [
                  'Manage your trips',
                  'Contact Customer Service',
                  'Safety Resource Center',
                ],
                isSmallScreen: isSmallScreen,
              ),
              FooterColumn(
                title: 'Discover',
                items: const [
                  'Genius loyalty program',
                  'Seasonal and holiday deals',
                  'Travel articles',
                  'Booking for Business',
                ],
                isSmallScreen: isSmallScreen,
              ),
              FooterColumn(
                title: 'Terms and settings',
                items: const [
                  'Privacy Notice',
                  'Terms of Service',
                  'Accessibility Statement',
                  'Modern Slavery Statement',
                ],
                isSmallScreen: isSmallScreen,
              ),
              FooterColumn(
                title: 'Partners',
                items: const [
                  'List your property',
                  'Partner help',
                  'Become an affiliate',
                  'Partner dispute',
                ],
                isSmallScreen: isSmallScreen,
              ),
              FooterColumn(
                title: 'About',
                items: const [
                  'About our site',
                  'How We Work',
                  'Sustainability',
                  'Press center',
                  'Investor relations',
                ],
                isSmallScreen: isSmallScreen,
              ),
            ],
          ),
          SizedBox(height: isSmallScreen ? 20 : 30),
          Wrap(
            spacing: isSmallScreen ? 12 : 16,
            runSpacing: isSmallScreen ? 8 : 12,
            children: const [
              _ServiceLink(text: 'Car rental'),
              _ServiceLink(text: 'Flight finder'),
              _ServiceLink(text: 'Restaurant reservations'),
              _ServiceLink(text: 'This Site for Travel Agents'),
            ],
          ),
          SizedBox(height: isSmallScreen ? 20 : 30),
          Center(
            child: Column(
              children: [
                Text(
                  'our site is part of Booking., the world leader in online travel and related services.',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 10 : 12,
                    color: const Color(0xFF666666),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isSmallScreen ? 6 : 8),
                Text(
                  'Copyright © 2025™. All rights reserved.',
                  style: TextStyle(
                    fontSize: isSmallScreen ? 10 : 12,
                    color: const Color(0xFF666666),
                  ),
                ),
                SizedBox(height: isSmallScreen ? 12 : 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterColumn extends StatelessWidget {
  final String title;
  final List<String> items;
  final bool isSmallScreen;

  const FooterColumn({
    required this.title,
    required this.items,
    required this.isSmallScreen,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSmallScreen ? 120 : 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: isSmallScreen ? 6 : 8),
          ...items.map((item) => Padding(
            padding: EdgeInsets.only(bottom: isSmallScreen ? 3 : 4),
            child: InkWell(
              onTap: () {},
              child: Text(
                item,
                style: TextStyle(
                  fontSize: isSmallScreen ? 10 : 12,
                  color: const Color(0xFF666666),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class _ServiceLink extends StatelessWidget {
  final String text;

  const _ServiceLink({required this.text});

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