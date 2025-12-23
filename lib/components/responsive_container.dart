import 'dart:async';

import 'package:flutter/material.dart';


class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? maxWidth;
  final BoxDecoration? decoration;
  final AlignmentGeometry? alignment;

  const ResponsiveContainer({
    Key? key,
    required this.child,
    this.padding,
    this.maxWidth,
    this.decoration,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;


    EdgeInsets resolvedPadding = padding ??
        EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 24,
          vertical: isMobile ? 12 : 16,
        );

    // Calculate responsive max width
    double resolvedMaxWidth = maxWidth ??
        (isMobile
            ? screenWidth * 0.95
            : isTablet
            ? screenWidth * 0.9
            : 1200);

    return Container(
      padding: resolvedPadding,
      alignment: alignment ?? Alignment.center,
      constraints: BoxConstraints(
        maxWidth: resolvedMaxWidth,
      ),
      decoration: decoration,
      child: child,
    );
  }
}


class ResponsiveImageContainer extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ResponsiveImageContainer({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: height ?? screenWidth * 0.6,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        color: const Color(0xFFF5F5F5),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Image.network(
          imageUrl,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return placeholder ??
                Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
          },
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ??
                Container(
                  color: const Color(0xFFF5F5F5),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Color(0xFF999999),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Image not available',
                          style: TextStyle(
                            color: const Color(0xFF666666),
                            fontSize: screenWidth < 360 ? 10 : 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }
}


class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign textAlign;
  final int? maxLines;
  final double? minFontSize;
  final double? maxFontSize;

  const ResponsiveText({
    Key? key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.minFontSize = 10,
    this.maxFontSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    double fontSize = style.fontSize ?? 14;
    if (screenWidth < 360) {
      fontSize = fontSize * 0.85;
    } else if (screenWidth < 600) {
      fontSize = fontSize * 0.95;
    }


    fontSize = fontSize.clamp(minFontSize!, maxFontSize!);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      style: style.copyWith(fontSize: fontSize),
    );
  }
}


class ResponsiveSpacing extends StatelessWidget {
  final double small;
  final double medium;
  final double large;

  const ResponsiveSpacing({
    Key? key,
    this.small = 8,
    this.medium = 12,
    this.large = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 360) {
      return SizedBox(height: small);
    } else if (screenWidth < 600) {
      return SizedBox(height: medium);
    } else {
      return SizedBox(height: large);
    }
  }
}


class SimpleImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final double width;
  final bool autoPlay;
  final Duration autoPlayInterval;

  const SimpleImageCarousel({
    Key? key,
    required this.imageUrls,
    required this.height,
    required this.width,
    this.autoPlay = true,
    this.autoPlayInterval = const Duration(seconds: 3),
  }) : super(key: key);

  @override
  State<SimpleImageCarousel> createState() => _SimpleImageCarouselState();
}

class _SimpleImageCarouselState extends State<SimpleImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    if (widget.autoPlay && widget.imageUrls.length > 1) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(widget.autoPlayInterval, (timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [

        SizedBox(
          height: widget.height,
          width: widget.width,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return ResponsiveImageContainer(
                imageUrl: widget.imageUrls[index],
                height: widget.height,
                width: widget.width,
                fit: BoxFit.cover,
                placeholder: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),

        // Page indicators
        if (widget.imageUrls.length > 1)
          Positioned(
            bottom: 10,
            child: Row(
              children: List.generate(widget.imageUrls.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}