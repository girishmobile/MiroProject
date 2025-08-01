import 'package:apple_invites/core/common/app_list_tile.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';

class OrderAndPayment extends StatelessWidget {
  const OrderAndPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyOrder(context));
  }

  _buildFancyOrder(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  _buildEmptyActivity(),
                  AppListTile(
                    title: "Payment Setting",
                    leadingIcon: Icons.payment_outlined,
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.paymentSetting);
                    },
                  ),
                  AppListTile(
                    title: "Support & Help",
                    leadingIcon: Icons.help_center_outlined,
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.paymentSupport);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "ORDER & PAYMENT",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildEmptyActivity() {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Icon(Icons.now_widgets, color: Colors.white, size: 36),
          loadTitleText(
            title: "NO ACTIVITY",
            fontSize: 18,
            fontWight: FontWeight.w900,
          ),
          loadSubTitleText(
            fontSize: 14,
            fontColor: Colors.white.withValues(alpha: 0.9),
            title:
                "When you make payments or charge users on GamePlan, your activity will show up here.",
          ),
        ],
      ),
    );
  }
}
