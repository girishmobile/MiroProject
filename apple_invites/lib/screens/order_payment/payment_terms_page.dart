import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class PaymentTermsPage extends StatelessWidget {
  const PaymentTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyTermsCondition(context));
  }

  _buildFancyTermsCondition(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(children: [_buildTermText()]),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "PAYMENT TERMS & CONDITIONS",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildTermText() {
    return loadGlassBackground(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(title: "PAYMENT TERMS"),
          _buildRowText(
            title: "1. Agreement to Terms",
            subTitle:
                "By adding a payment method, you acknowledge and agree to our standard payment terms. These terms govern all future transactions made through the app using the selected payment method.",
          ),
          _buildRowText(
            title: "2. Billing and Charges",
            subTitle:
                "Transactions may include one-time payments, subscriptions, or recurring charges based on your selections. Billing cycles, applicable fees, and taxes will be applied as per the chosen plan.",
          ),
          _buildRowText(
            title: "3. Refunds and Cancellations",
            subTitle:
                "Refund policies vary by product or service. Dummy refund rules apply here, such as a 7-day refund window or non-refundable digital items. Please review the final policy at launch.",
          ),
          _buildRowText(
            title: "4. Payment Method Validity",
            subTitle:
                "You are responsible for ensuring your payment method is active, valid, and has sufficient balance or credit. Payments may be declined due to insufficient funds, expiration, or card restrictions.",
          ),
          _buildRowText(
            title: "5. Third-Party Processing",
            subTitle:
                "All payments may be processed by third-party gateways. We are not responsible for issues caused by your card issuer, bank, or the payment processor.",
          ),
          _buildRowText(
            title: "6. Modifications",
            subTitle:
                "These payment terms are subject to change. Dummy updates may occur without prior notice. You should check the latest terms before making any new transaction.",
          ),
        ],
      ),
    );
  }

  _buildRowText({required String title, required String subTitle}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4,
      children: [
        loadTitleText(fontSize: 16, title: title),
        Container(
          margin: const EdgeInsets.only(left: 8),
          child: loadSubTitleText(
            fontSize: 14,
            title: subTitle,
            fontColor: Colors.white.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
