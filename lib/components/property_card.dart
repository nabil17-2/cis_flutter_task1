import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'responsive_container.dart';

class PropertyCard extends StatefulWidget {
  final String propertyName;
  final String location;
  final String distance;
  final String rating;
  final String price;
  final List<String> imageUrls;

  const PropertyCard({
    required this.propertyName,
    required this.location,
    required this.distance,
    required this.rating,
    required this.price,
    this.imageUrls = const [],
    Key? key,
  }) : super(key: key);

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {

  static const List<List<String>> _reliableImageSets = [
    [
      'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=800&auto=format&fit=crop', // Hotel room 1
      'https://images.unsplash.com/photo-1590490360182-c33d57733427?w-800&auto=format&fit=crop', // Hotel room 2
      'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=800&auto=format&fit=crop', // Hotel lobby
    ],
    [
      'https://images.unsplash.com/photo-1611892440504-42a792e24d32?w=800&auto=format&fit=crop', // Apartment 1
      'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&auto=format&fit=crop', // Apartment 2
      'https://images.unsplash.com/photo-1518780664697-55e3ad937233?w=800&auto=format&fit=crop', // Luxury room
    ],
    [
      'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=800&auto=format&fit=crop', // Resort 1
      'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=800&auto=format&fit=crop', // Resort 2
      'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=800&auto=format&fit=crop', // Resort pool
    ],
    [
      'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=800&auto=format&fit=crop', // Villa 1
      'https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=800&auto=format&fit=crop', // Villa 2
      'https://images.unsplash.com/photo-1613977257363-707ba9348227?w=800&auto=format&fit=crop', // Villa view
    ],
  ];

  List<String> get _effectiveImageUrls {

    if (widget.imageUrls.isNotEmpty && _hasAtLeastOneWorkingImage()) {
      return widget.imageUrls;
    }


    final index = widget.propertyName.hashCode % _reliableImageSets.length;
    return _reliableImageSets[index];
  }

  bool _hasAtLeastOneWorkingImage() {

    return widget.imageUrls.any((url) =>
    url.contains('http') &&
        (url.endsWith('.jpg') ||
            url.endsWith('.jpeg') ||
            url.endsWith('.png')));
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive card dimensions
    double cardWidth;
    double cardHeight;

    if (screenWidth < 360) {
      cardWidth = screenWidth * 0.82;
      cardHeight = 420;
    } else if (screenWidth < 600) {
      cardWidth = screenWidth * 0.72;
      cardHeight = 440;
    } else {
      cardWidth = 320;
      cardHeight = 460;
    }

    return Container(
      width: cardWidth,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth < 360 ? 4 : 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.lightGrayBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE CAROUSEL
          Container(
            height: cardWidth * 0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Color(0xFFF5F5F5),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: SimpleImageCarousel(
                imageUrls: _effectiveImageUrls,
                height: cardWidth * 0.6,
                width: cardWidth,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
              ),
            ),
          ),

          // Property Details
          Padding(
            padding: EdgeInsets.all(screenWidth < 360 ? 10 : 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.propertyName,
                  style: TextStyle(
                    fontSize: screenWidth < 360 ? 15 : 17,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 6),

                Text(
                  widget.location,
                  style: TextStyle(
                    fontSize: screenWidth < 360 ? 12 : 14,
                    color: AppColors.gray,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Text(
                  widget.distance,
                  style: TextStyle(
                    fontSize: screenWidth < 360 ? 12 : 14,
                    color: AppColors.gray,
                  ),
                ),

                const SizedBox(height: 12),

                // Rating and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Text(
                            '★',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            widget.rating,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Flexible(
                      child: Text(
                        'From ${widget.price}',
                        style: TextStyle(
                          fontSize: screenWidth < 360 ? 15 : 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Book Now Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _showBookingDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryBlue,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Book Now',
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
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Booking'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.propertyName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text('Price: ${widget.price}'),
            const SizedBox(height: 8),
            Text('Rating: ${widget.rating}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Booking confirmed for ${widget.propertyName}'),
                  backgroundColor: Colors.green,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryBlue,
            ),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}