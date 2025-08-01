import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/help_provider.dart';
import 'package:apple_invites/screens/setting/help/report_request.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerSupport extends StatelessWidget {
  CustomerSupport({super.key});

  final List<ReportModel> reports = [
    ReportModel(
      reportText: "Customer Report #1",
      reportDate: DateTime.now().subtract(Duration(days: 2)),
      responseText: "GamePlan response to Report #2",
      responseDate: DateTime.now().subtract(Duration(days: 1, hours: 5)),
    ),
    ReportModel(
      reportText: "Customer Report #2",
      reportDate: DateTime.now().subtract(Duration(days: 3)),
      responseText: "",
      responseDate: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buiFancyList(context));
  }

  _buiFancyList(BuildContext context) {
    final provider = Provider.of<HelpProvider>(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child:
              provider.noSupportYet
                  ? loadEmptyView(
                    emptyIcon: Icons.report_outlined,
                    title: "You Haven't Reported Anything",
                    message:
                        "Read our Community Guidelines to learn what what quantifies as customer support.",
                    buttonTitle: "See Community Guidelines",
                    onPressed: () {
                      provider.setIsSupportYet(false);
                    },
                  )
                  : ListView.builder(
                    itemCount: reports.length,
                    itemBuilder: (context, index) {
                      final report = reports[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteName.reportRequestDetails,
                          );
                        },
                        child: loadGlassBackground(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 4,
                                  children: [
                                    _buildListItem(
                                      text: report.reportText,
                                      date: report.reportDate,
                                      isResponse: false,
                                    ),
                                    if (report.responseText != null &&
                                        report.responseDate != null)
                                      _buildListItem(
                                        text: report.responseText!,
                                        date: report.responseDate!,
                                        isResponse: true,
                                      ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: kBgCardColor,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "CUSTOMER SUPPORT",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListItem({
    required String text,
    required DateTime date,
    required bool isResponse,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      //margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadTitleText(title: text, fontSize: 14),
          SizedBox(height: 4),
          Text(
            _formatDate(date),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return "${dt.day}/${dt.month}/${dt.year} ${dt.hour}:${dt.minute.toString().padLeft(2, '0')}";
  }
}
