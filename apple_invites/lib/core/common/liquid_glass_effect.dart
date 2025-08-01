import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LiquidGlassEffect extends StatefulWidget {
  final Widget child;
  const LiquidGlassEffect({super.key, required this.child});

  @override
  State<LiquidGlassEffect> createState() => _LiquidGlassEffectState();
}

class _LiquidGlassEffectState extends State<LiquidGlassEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder:
          (context, child) => CustomPaint(
            painter: LiquidPainter(_controller.value),
            child: loadGlassBackground(child: widget.child),
          ),
    );
  }
}

class LiquidPainter extends CustomPainter {
  final double animationValue;
  LiquidPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.08)
          ..style = PaintingStyle.fill;
    final path = Path();
    double waveHeight = 6;
    double waveLength = size.width;

    path.moveTo(0, size.height * 0.5);
    for (double i = 0; i <= waveLength; i++) {
      double y =
          sin((i / waveLength * 2 * pi) + (animationValue * 2 * pi)) *
              waveHeight +
          size.height * 0.5;
      path.lineTo(i, y);
    }
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant LiquidPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
