import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

// Outside the widget class
final ScrollController _scrollController = ScrollController();
final GlobalKey _pollVotingKey = GlobalKey();

class SimpleEventDetail extends StatelessWidget {
  const SimpleEventDetail({super.key});

  // Use post-frame callback + delay to ensure context is ready
  void _scrollToPollVoting() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _pollVotingKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          alignment: 0.1, // scroll slightly above the top
        );
      } else {
        print("Poll context is still null");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 330,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.red,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 330,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.green,
                  child: SizedBox(
                    height: 44,
                    width: 210,
                    child: ElevatedButton(
                      onPressed: _scrollToPollVoting,
                      child: Text(
                        "Vote For Job",
                        style: TextStyle(
                          fontFamily: fontRoboto,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 330,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.blue,
                ),
                Container(
                  height: 330,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.yellow,
                ),
                Container(
                  key: _pollVotingKey,
                  height: 330,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.white,
                ),
                Container(
                  height: 330,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
