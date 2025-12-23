import 'package:flutter/material.dart';
import '../widgets/header_section.dart';
import '../widgets/search_section.dart';
import '../widgets/offers_section.dart';
import '../widgets/property_type_section.dart';
import '../widgets/trending_destinations_section.dart';
import '../widgets/home_guests_section.dart';
import '../widgets/vacation_rentals_section.dart';
import '../widgets/travel_more_section.dart';
import '../widgets/popular_destinations_section.dart';
import '../widgets/footer_section.dart';

class PropertyInfoScreen extends StatelessWidget {
  const PropertyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Property Information Screen'),
        centerTitle: true,
        backgroundColor: const Color(0xFF003580),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SearchSection(),
              const OffersSection(),
              const PropertyTypeSection(),
              const TrendingDestinationsSection(),
              const HomeGuestsSection(),
              const VacationRentalsSection(),
              const TravelMoreSection(),
              const PopularDestinationsSection(),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}