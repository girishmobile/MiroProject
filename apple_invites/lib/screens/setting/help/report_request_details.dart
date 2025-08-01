import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:flutter/material.dart';

class ReportRequestDetails extends StatelessWidget {
  const ReportRequestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyRequestDetail(context));
  }

  _buildFancyRequestDetail(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(children: [Text("Details")]),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "REPORT DETAILS",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
