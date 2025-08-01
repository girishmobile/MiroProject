import 'package:flutter/material.dart';

class TransparentView extends StatelessWidget {
  const TransparentView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withValues(alpha: 0.8),
            Colors.black.withValues(alpha: 0.4),
            Colors.black.withValues(alpha: 0.0),
          ],
        ),
      ),
      child: SizedBox.shrink(),
    );
  }
}
