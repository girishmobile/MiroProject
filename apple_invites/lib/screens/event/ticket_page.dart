import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyTicketPage(context));
  }

  _buildFancyTicketPage(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [
                  loadGlassBackground(
                    child: Column(
                      spacing: 16,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        loadRowWithIcon(
                          title: "TICKETS",
                          iconName: Icons.card_membership_outlined,
                        ),
                        _buildPaidOrFeeButton(),
                        Row(
                          spacing: 16,
                          children: [
                            Expanded(
                              child: AppTextfield(hintText: 'Available Qty'),
                            ),
                            Expanded(
                              child: AppTextfield(hintText: "Price (\$)"),
                            ),
                          ],
                        ),
                        loadRowWithIcon(
                          title: "SALE START AND END",
                          iconName: Icons.date_range_outlined,
                        ),
                        _buildSaleStart(context),
                        _buildSaleEnd(context),
                        loadRowWithIcon(
                          title: "TICKETS PER ORDER",
                          iconName: Icons.shopping_cart_outlined,
                        ),
                        _buildMinMaxSale(),
                        loadGlassButton(
                          //verticalPadding: 14,
                          fontSize: 14,
                          text: "SAVE & CONTINUE",
                          onPress: () {
                            Navigator.pop(context);
                          },
                        ),
                        loadSubTitleText(
                          title:
                              "Ticket will show up in guests' accounts if they purchase or reserve them",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "TICKETS",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildPaidOrFeeButton() {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: loadGlassButton(text: "PAID", fontSize: 14, onPress: () {}),
        ),
        Expanded(
          child: loadGlassButton(text: "FREE", fontSize: 14, onPress: () {}),
        ),
      ],
    );
  }

  _buildSaleStart(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Flexible(
          child: loadTextField(
            hintText: "Start Date",
            readOnly: true,
            suffixIcon: Icons.arrow_drop_down,
            onTaped: () {
              showGlassCalendarDialog(
                context,
                firstDay: DateTime.now(),
                onDateSelected: (dateTime) {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),

        Flexible(
          child: loadTextField(
            hintText: "Start Time",
            readOnly: true,
            suffixIcon: Icons.arrow_drop_down,
            onTaped: () {
              showGlassTimeDialog(context, onTimeSelected: (selectedTime) {});
            },
          ),
        ),
      ],
    );
  }

  _buildSaleEnd(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Flexible(
          child: loadTextField(
            hintText: "End Date",
            readOnly: true,
            suffixIcon: Icons.arrow_drop_down,
            onTaped: () {
              showGlassCalendarDialog(
                context,
                firstDay: DateTime.now(),
                onDateSelected: (dateTime) {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        Flexible(
          child: loadTextField(
            hintText: "End Time",
            readOnly: true,
            suffixIcon: Icons.arrow_drop_down,
            onTaped: () {
              showGlassTimeDialog(context, onTimeSelected: (timeOfDay) {});
            },
          ),
        ),
      ],
    );
  }

  _buildMinMaxSale() {
    return Row(
      spacing: 16,
      children: [
        Expanded(child: AppTextfield(hintText: "Minimum")),
        Expanded(child: AppTextfield(hintText: 'Maximum')),
      ],
    );
  }
}
