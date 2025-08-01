import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppCarousel extends StatelessWidget {
  const AppCarousel({super.key, required this.imageUrls, this.onPageChanged});

  final List<String> imageUrls;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return _layoutCarousel();
  }

  _layoutCarousel() {
    return CarouselSlider(
      items:
          imageUrls.map((imageUrl) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
      options: CarouselOptions(
        height: double.infinity,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        enlargeFactor: 0.3,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true, // Zoom effect
        viewportFraction: 0.6, // Width of each slide
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal, // Can be Axis.vertical
        animateToClosest: true,
        onPageChanged: onPageChanged,
      ),
    );
  }
}

/**  
  */
