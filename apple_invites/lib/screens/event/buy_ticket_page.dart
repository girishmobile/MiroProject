import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyBuyTicket(context));
  }

  _buildFancyBuyTicket(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: ListView(children: [_buildEventDetail(context)]),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "BUY TICKET",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildEventDetail(BuildContext context) {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'Your Event name is here.',
            iconName: Icons.event,
          ),
          loadDivider(),
          loadRowWithIcon(
            iconName: Icons.place_outlined,
            iconSize: 20,
            fontSize: 12,
            fontColor: Colors.white.withValues(alpha: 0.7),
            title: "# I-404 Amazon world heritage site. NY San Francisco, USA",
          ),
          loadDivider(),
          loadRowWithIcon(
            iconName: Icons.calendar_month_outlined,
            fontSize: 12,
            iconSize: 20,
            fontColor: Colors.white.withValues(alpha: 0.7),
            title: "02-July-2025 10:10 AM",
          ),
          loadDivider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              loadTitleText(title: "#Items(1)"),
              loadTitleText(title: '\$9.00'),
            ],
          ),
          loadDivider(),
          loadRowWithIcon(
            iconName: Icons.payment_outlined,
            title: "Payment Method",
            fontSize: 18,
          ),
          loadDivider(),
          loadSubTitleText(title: "Choose payment method", fontSize: 12),

          loadGlassButton(
            text: "Apple Pay",
            icon: Icons.apple_outlined,
            onPress: () {
              _showApplePayPayment(context);
            },
          ),
          loadGlassButton(
            text: "Credit Card",
            icon: Icons.credit_card_outlined,
            onPress: () {},
          ),
          loadGlassButton(
            text: "Pay Pal",
            icon: Icons.paypal_outlined,
            onPress: () {},
          ),
        ],
      ),
    );
  }

  _showApplePayPayment(BuildContext context) {}
}
