import 'package:apple_invites/core/common/app_checkbox.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewCardPage extends StatelessWidget {
  const NewCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyNewCard(context));
  }

  _buildFancyNewCard(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(children: [_buildNewCartItem(context)]),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: AppNavigationBar(
            title: "NEW CARD",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildNewCartItem(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context, listen: false);

    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          loadRowWithIcon(
            iconName: Icons.credit_card_outlined,
            title: "ADD DEBIT OR CREDIT CARD",
          ),
          AppTextfield(hintText: "Card Number"),
          _buildRowForExpiry(),
          AppTextfield(hintText: "ZIP Code"),

          AppTextWidget(
            fontSize: 12,
            color: Colors.white.withValues(alpha: 0.7),
            text:
                "Your payment method is securely saved for the next time you use GamePlan Pay. Payment terms apply.",
          ),
          AppCheckbox(
            title: "Payment terms apply.",
            onTap: () {
              Navigator.pushNamed(context, RouteName.paymentTerms);
            },
          ),
          loadGlassButton(
            text: "SAVE",
            onPress: () {
              Navigator.pop(context);
              provider.setIsEmptyPayment(false);
            },
          ),
        ],
      ),
    );
  }

  _buildRowForExpiry() {
    return Row(
      children: [
        Flexible(
          child: loadTextField(
            hintText: "Expiry (MM/YY)",
            readOnly: true,

            onTaped: () {
              // showGlassCalendarDialog(
              //   context,
              //   firstDay: DateTime.now(),
              //   onDateSelected: (dateTime) {
              //     provider.setSelectedStartDate(dateTime);
              //     Navigator.pop(context);
              //   },
              // );
            },
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: loadTextField(
            hintText: "Security Code",
            readOnly: true,

            onTaped: () {},
          ),
        ),
      ],
    );
  }
}
