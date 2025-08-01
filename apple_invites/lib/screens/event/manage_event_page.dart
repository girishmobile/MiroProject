import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_sliver_top_bar.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class ManageEventPage extends StatelessWidget {
  const ManageEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyManageEvent(context));
  }

  _buildFancyManageEvent(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: CustomScrollView(
            slivers: [
              SliverList.list(
                children: [_buildEventPhoto(), _buildEventDetails()],
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "MANAGE EVENT",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  _buildEventPhoto() {
    return loadGlassBackground(
      leftPadding: 0,
      rightPadding: 0,
      topPadding: 0,
      bottomPadding: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.hardEdge,
        child: loadAssetImage(
          name: appEvent_2,
          fit: BoxFit.cover,
          height: photoSize,
        ),
      ),
    );
  }

  _buildEventDetails() {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          AppTextfield(hintText: 'Event name'),
          AppTextfield(hintText: 'Category', suffixIcon: Icons.arrow_drop_down),
          _buildDateTime(),
          AppTextfield(
            hintText: 'Event Venue',
            suffixIcon: Icons.arrow_drop_down,
            readOnly: true,
          ),
          AppTextfield(hintText: 'If Other, please type here'),
          AppTextfield(hintText: 'Event Note'),
          AppTextWidget(
            text:
                'User can edit event name, date, and time; the other parts of the frame get dark; updates are sent to guests via notifications',
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 12,
          ),
          loadGlassButton(text: 'Notify & Changes', onPress: () {}),
        ],
      ),
    );
  }

  _buildDateTime() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      spacing: 16,
      children: [
        Expanded(
          child: AppTextfield(
            hintText: 'Event date',
            suffixIcon: Icons.arrow_drop_down,
            readOnly: true,
          ),
        ),
        Expanded(
          child: AppTextfield(
            hintText: 'Event Time',
            suffixIcon: Icons.arrow_drop_down,
            readOnly: true,
          ),
        ),
      ],
    );
  }
}
