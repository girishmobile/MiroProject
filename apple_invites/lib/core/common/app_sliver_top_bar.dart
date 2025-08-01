import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/views/app_header_text.dart';
import 'package:flutter/material.dart';

class AppSliverTopBar extends StatelessWidget {
  const AppSliverTopBar({
    super.key,
    required this.title,
    required this.isEdited,
    required this.imageUrl,
  });
  final String title;
  final bool isEdited;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white.withValues(alpha: 0.5),
      expandedHeight: photoSize,
      floating: false,
      pinned: true,

      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final isCollapsed =
              constraints.maxHeight <=
              kToolbarHeight + MediaQuery.of(context).padding.top;
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                key: const ValueKey('eventDetailsBackground'),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.deepPurple),
                  );
                },
              ),
              // Gradient only when collapsed
              if (isCollapsed)
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.50),
                        Colors.white.withValues(alpha: 0.90),
                      ],
                    ),
                  ),
                ),
              // Actual FlexibleSpaceBar on top of everything
              FlexibleSpaceBar(
                title:
                    isCollapsed
                        ? AppHeaderText(title: title, color: Colors.white)
                        : null,
                background: const SizedBox.shrink(), // Avoid double background
              ),
              // Edit button if needed
              if (isEdited)
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: loadCircleIcon(
                    backgroundColor: Colors.white.withValues(alpha: 0.5),
                    icon: Icons.edit,
                    onTap: () {
                      // loadBottomSheetForUploadImageNew(context);
                      loadBottomSheetWithSafeArea(
                        context: context,
                        child: loadImageOrCamera(
                          context,
                          onPhotoTap: (imagePath) {},
                          onCameraTap: (imagePath) {},
                        ),
                      );
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

/**
 * old code
 * FlexibleSpaceBar(
            title:
                isCollapsed
                    ? AppHeaderText(title: title, color: Colors.white)
                    : null, // Show title only when collapsed
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  key: const ValueKey('eventDetailsBackground'),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(color: Colors.red),
                    );
                  },
                ),

                isEdited
                    ? Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.white, size: 20),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
              ],
            ),
          );
 */
