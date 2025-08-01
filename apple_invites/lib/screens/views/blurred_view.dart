import 'dart:ui';

import 'package:flutter/material.dart';

//915010007672181
// UTIB0004759

class BlurredView extends StatelessWidget {
  const BlurredView({
    super.key,
    required this.child,
    this.blurX = 20,
    this.blurY = 20,
    this.overlayColor = Colors.transparent,
  });
  final Widget child;
  final double blurX;
  final double blurY;
  final Color overlayColor;
  @override
  Widget build(BuildContext context) {
    return // Gradient Blur Overlay
    Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent, // No blur at top
                Colors.black.withValues(alpha: 0.1),
                Colors.black.withValues(alpha: 0.3),
                Colors.black.withValues(alpha: 0.6),
                Colors.black.withValues(alpha: 0.9), // Strong blur at bottom
              ],
              stops: [0.0, 0.4, 0.6, 0.8, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}

/*
wea have make blur view for the custom view and layout to using this class to render any where in our app
this common blurred layout for all necessary view in our app
*/
