import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:flutter/material.dart';

class LocationOptionPage extends StatelessWidget {
  const LocationOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyLocationOption(context));
  }

  _buildFancyLocationOption(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: CustomScrollView(
            // physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList.list(
                children: [_buildLocationOption(), _buildVotingTimeFrame()],
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "LOCATION OPTIONS",
            onLeftTap: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }

  _buildLocationOption() {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'Venue Options',
            iconName: Icons.location_on_outlined,
          ),
          AppTextfield(
            hintText: "Venue location option #1",
            prefixIcon: Icons.search,
          ),
          AppTextfield(
            hintText: "Venue location - option #2",
            prefixIcon: Icons.search,
          ),
          AppTextfield(
            hintText: "Venue location - option #3",
            prefixIcon: Icons.search,
          ),
          AppTextfield(
            hintText: "Venue location - option #4",
            prefixIcon: Icons.search,
          ),
          AppTextfield(
            hintText: "Venue location - option #5",
            prefixIcon: Icons.search,
          ),
        ],
      ),
    );
  }

  _buildVotingTimeFrame() {
    return loadGlassBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          loadRowWithIcon(
            title: 'Voting Time Frame',
            iconName: Icons.calendar_month_outlined,
          ),
          Row(
            children: [
              Flexible(
                child: loadTextField(
                  // text:
                  //     provider.selectedStartDate == null
                  //         ? ''
                  //         : DateTimeHelper.getFormattedDate(
                  //           provider.selectedStartDate ?? DateTime.now(),
                  //           format: 'dd MMMM yyyy',
                  //         ),
                  hintText: "Start Date",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
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
                  // text: provider.startTime,
                  hintText: "Start Time",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
                  onTaped: () {
                    // showGlassTimeDialog(
                    //   context,
                    //   onTimeSelected: (selectedTime) {
                    //     provider.setSelectedStartTime(
                    //       selectedTime.format(context),
                    //     );
                    //   },
                    // );
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: loadTextField(
                  //text: provider.selectedEndDate ?? '',
                  hintText: "End Date",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
                  onTaped: () {
                    // showGlassCalendarDialog(
                    //   context,
                    //   firstDay: provider.selectedStartDate ?? DateTime.now(),
                    //   onDateSelected: (dateTime) {
                    //     provider.setSelectedEndDate(
                    //       DateTimeHelper.getFormattedDate(
                    //         dateTime,
                    //         format: 'dd MMMM yyyy',
                    //       ),
                    //     );
                    //     Navigator.pop(context);
                    //   },
                    // );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: loadTextField(
                  //text: provider.endTime,
                  hintText: "End Time",
                  readOnly: true,
                  suffixIcon: Icons.arrow_drop_down,
                  onTaped: () {
                    // showGlassTimeDialog(
                    //   context,
                    //   onTimeSelected: (timeOfDay) {
                    //     provider.setSelectedEndTime(timeOfDay.format(context));
                    //   },
                    // );
                  },
                ),
              ),
            ],
          ),

          loadSubTitleText(
            title: 'Timezone base on device',
            fontColor: Colors.white.withValues(alpha: 0.7),
          ),
          loadGlassButton(text: "SUBMIT", onPress: () {}),
        ],
      ),
    );
  }
}
