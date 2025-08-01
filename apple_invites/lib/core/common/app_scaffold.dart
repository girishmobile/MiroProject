import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.child,
    this.isBottomSafeArea = true,
  });

  final Widget child;
  final bool isBottomSafeArea;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: loadAssetImage(name: appBackground, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.2)),
          ),
          SafeArea(bottom: isBottomSafeArea, child: child),
        ],
      ),
    );
  }
}
// child: loadNetworkImage(
            //   imageUrl: "https://media.giphy.com/media/ICOgUNjpvO0PC/giphy.gif",
            //   fit: BoxFit.cover,
            // ),