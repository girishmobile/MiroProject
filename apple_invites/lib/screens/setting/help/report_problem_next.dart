import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class ReportProblemNext extends StatelessWidget {
  const ReportProblemNext({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBottomSafeArea: false,
      child: _buildFancyReportNext(context),
    );
  }

  _buildFancyReportNext(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            children: [
              Expanded(child: ListView(children: [_buildReportItem(context)])),
              Align(
                alignment: Alignment.bottomCenter,
                child: loadGlassBackground(
                  bottomPadding: 24,
                  bottomMargin: 0,
                  leftMargin: 0,
                  rightMargin: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      loadGlassButton(
                        text: "SEND REPORT",
                        onPress: () {
                          showTopSnackBar(
                            context,
                            Row(
                              spacing: 12,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.check_circle_outline_outlined,
                                    size: 36,
                                  ),
                                ),

                                Expanded(
                                  child: loadSubTitleText(
                                    fontSize: 14,
                                    title:
                                        "Report uploaded successfully!\nYour feedback helps make GamePlan better.",
                                  ),
                                ),
                              ],
                            ),
                          );
                          showAlertWithGlassEffect(
                            isSingleBtn: true,
                            context: context,
                            leftbuttonText: "CLOSE",
                            title: "Thank You!",
                            message:
                                "Your feedback helps make GamePlan better for everyone.",
                            onConfirm: () {},
                          );
                        },
                      ),
                      loadGlassButton(
                        text: "DON'T SEND REPORT",
                        onPress: () {
                          Navigator.of(context).popUntil(
                            (route) =>
                                route.settings.name == RouteName.helpPage,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

  _buildReportItem(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12,
        children: [
          loadRichText(textMsg: "Learn more"),
          Row(
            children: [
              Expanded(
                child: loadSubTitleText(
                  title: "Include Complete Logs and Diagnostics",
                ),
              ),
              loadDynamicSwitchButton(
                context: context,
                value: false,
                onChanged: (val) {},
              ),
            ],
          ),
          loadSubTitleText(
            fontColor: Colors.white.withValues(alpha: 0.7),
            fontSize: 12,
            title:
                "This includes information such as user activity, network logs, crash logs and memory dumps associated with the GamePlan app.",
          ),
        ],
      ),
    );
  }
}
