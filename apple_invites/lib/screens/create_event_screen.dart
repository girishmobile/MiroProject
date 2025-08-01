import 'dart:ui';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/views/transparent_view.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(extendBody: true, body: _loadImageBlurred(screenHeight));
  }

  _loadImageBlurred(double screenHeight) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            key: ValueKey(imageUrl),
          ),
        ),
        TransparentView(child: Center(child: SizedBox.shrink())),
        _loadBlurredImage(screenHeight),
        _loadSilverAppbar(screenHeight),
      ],
    );
  }

  _loadBlurredImage(double screenHeight) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Apply blur
          child: Container(
            height: screenHeight * 0.5, // Only cover the bottom half
            color: Colors.black.withValues(
              alpha: 0.0,
            ), // Optional dark overlay to emphasize blur
          ),
        ),
      ),
    );
  }

  _loadSilverAppbar(double screenHeight) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: (screenHeight * 0.5),
          floating: false,
          pinned: true,
          //flexibleSpace: FlexibleSpaceBar(title: Text('SilverAppbar Example')),
        ),
        SliverList.list(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(16),

              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                spacing: 10,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Event Title',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                      //filled: true,
                      // fillColor: Colors.black.withValues(alpha: 0.5),
                    ),
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.25),
                    height: 0.5,
                  ),
                  Icon(
                    Icons.calendar_month,
                    size: 28,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),

                  AppTextWidget(
                    text: 'Date and Time',
                    textStyle: TextStyle(
                      fontFamily: fontRoboto,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.8),
                      letterSpacing: 1.2,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withValues(alpha: 0.25),
                    height: 0.5,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 28,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                  AppTextWidget(
                    text: 'Location',
                    textStyle: TextStyle(
                      fontFamily: fontRoboto,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.8),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(16),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(16),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(16),
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(16),
              height: 190,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/**
 *  // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) =>
        //         ListTile(title: Text("Item index ${index + 1}")),
        //     childCount: 18,
        //   ),
        // ),
        this is the best view of List Binding and Sliver App bar for top scrollview 
        with flexible  with flexible animation for the top of the screen
        
 */
