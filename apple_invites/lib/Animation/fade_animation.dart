import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FadeAnimation({super.key, this.delay = 0.0, required this.child});
  @override
  Widget build(BuildContext context) {
    final tween =
        MovieTween()
          ..tween(
            'opacity',
            Tween(begin: 0.0, end: 1.0),
            duration: Duration(milliseconds: 500),
          )
          ..tween(
            'translateY',
            Tween(begin: -40.0, end: 0.0),
            duration: Duration(microseconds: 50),
            curve: Curves.easeOut,
          );
    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: tween,
      duration: tween.duration,
      builder: (context, value, _) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.translate(
            offset: Offset(0, value.get('translateY')),
            child: child,
          ),
        );
      },
    );
  }
}

/***
 */
