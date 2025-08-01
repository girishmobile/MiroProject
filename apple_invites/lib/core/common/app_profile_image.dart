import 'package:apple_invites/core/colors/colors.dart';
import 'package:flutter/material.dart';

class AppProfileImage extends StatelessWidget {
  const AppProfileImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.radius,
    this.text,
    this.onTap,
  });
  final String imageUrl;
  final double? width;
  final double? radius;
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withAlpha(100),
        ),
        child: CircleAvatar(
          radius: radius ?? 24,
          backgroundColor: kBgCardColor,
          backgroundImage:
              imageUrl != "" || imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : null,
          child:
              (imageUrl == "" || imageUrl.isEmpty)
                  ? Icon(Icons.person, size: radius, color: kIconColor)
                  : null,
        ),
      ),
    );
  }
}
