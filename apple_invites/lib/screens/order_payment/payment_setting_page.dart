import 'dart:ui';

import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_list_tile.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:apple_invites/screens/provider/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSettingPage extends StatelessWidget {
  const PaymentSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBottomSafeArea: false,
      child: _buildFancyPaymentSetting(context),
    );
  }

  _buildFancyPaymentSetting(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context, listen: true);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child:
              provider.isEmptyPayment
                  ? loadEmptyView(
                    emptyIcon: Icons.credit_card_off_outlined,
                    title: "No Payment Method",
                    message:
                        "You haven't added any payment method yet. Add one now to make your checkout seamless.",
                    buttonTitle: "ADD PAYMENT METHOD",
                    onPressed: () {
                      _buildPaymentOptions(context);
                    },
                  )
                  : CustomScrollView(
                    slivers: [
                      SliverList.list(
                        children: [
                          AppListTile(
                            title: "ICICI BANK",
                            subtitle: "[Credit ----xxxx9098]",
                            leadingIcon: Icons.credit_card_outlined,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.newCardPage,
                              );
                            },
                          ),

                          AppListTile(
                            leadingIcon: Icons.credit_card_outlined,
                            title: "KOTAK BANK",
                            subtitle: "[Debit ----xxxx1234]",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.newCardPage,
                              );
                            },
                          ),
                          AppListTile(
                            leadingIcon: Icons.verified_outlined,
                            title: "Venom",
                            subtitle: "Venom Wallet",
                            onTap: () {},
                          ),
                          AppListTile(
                            leadingIcon: Icons.paypal_outlined,
                            title: "PayPal",
                            subtitle: "girish@paypal.com",
                            onTap: () {},
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 104)),
                    ],
                  ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "PAYMENT SETTINGS",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        !provider.isEmptyPayment
            ? Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildAddPaymentButton(context),
            )
            : SizedBox.shrink(),
      ],
    );
  }

  _buildPaymentOptions(BuildContext context) {
    return loadBottomSheetWithSafeArea(
      context: context,
      child: _buildBottomContent(context),
    );
  }

  Widget _buildBottomContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Center(
          child: Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        loadSubTitleText(title: "ADD PAYMENT METHOD"),
        loadGlassButton(
          text: "CREDIT OR DEBIT CARD",
          icon: Icons.credit_card_outlined,
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);

            Navigator.pushNamed(context, RouteName.newCardPage);
          },
        ),
        loadGlassButton(
          text: "VENMO",
          icon: Icons.verified_outlined,
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          icon: Icons.paypal_outlined,
          text: "PAYPAL",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
        loadGlassButton(
          text: "CANCEL",
          fontSize: 14,
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildAddPaymentButton(BuildContext context) {
    return _buildGlassEffect(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          loadGlassButton(
            text: "ADD PAYMENT METHOD",
            onPress: () {
              _buildPaymentOptions(context);
            },
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Text(
              "Securely save your preferred payment option",
              style: TextStyle(
                fontFamily: fontRoboto,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                letterSpacing: 1.02,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildGlassEffect({Widget? child}) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withAlpha(40)),
            gradient: appGradient,
          ),
          child: child,
        ),
      ),
    );
  }
}
