import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class ReportAProblem extends StatelessWidget {
  const ReportAProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyList(context));
  }

  _buildFancyList(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(children: [_buildReportView(context)]),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: AppNavigationBar(
            title: "REPORT A PROBLEM",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildReportView(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          loadTextField(hintText: "Summary"),
          loadMultiLineTextField(
            minLine: 5,
            maxLine: 10,
            hintText: "Report message...",
          ),

          Row(
            spacing: 16,
            children: [
              Flexible(
                child: loadGlassButton(
                  icon: Icons.photo_size_select_actual_outlined,
                  fontSize: 14,
                  text: "UPLOAD",
                  onPress: () {},
                ),
              ),
              Flexible(
                child: loadGlassButton(
                  icon: Icons.camera_alt_outlined,
                  fontSize: 14,
                  text: "CAMERA",
                  onPress: () {},
                ),
              ),
            ],
          ),
          loadGlassButton(
            text: "NEXT",
            onPress: () {
              Navigator.pushNamed(context, RouteName.reportProblemNext);
            },
          ),
        ],
      ),
    );
  }
}
