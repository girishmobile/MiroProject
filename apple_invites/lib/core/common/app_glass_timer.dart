import 'dart:ui';

import 'package:apple_invites/core/colors/colors.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:flutter/material.dart';

class AppGlassTimer extends StatelessWidget {
  const AppGlassTimer({
    super.key,
    required ValueChanged<TimeOfDay> onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    TimeOfDay selectedTime = TimeOfDay.now();
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 460,
          // padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withAlpha(40)),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withValues(alpha: 0.1),
                Colors.white.withValues(alpha: 0.05),
              ],
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: TimePickerThemeData(
                padding: EdgeInsets.all(8),
                backgroundColor: Colors.transparent,
                hourMinuteTextColor: Colors.white,
                hourMinuteColor: Colors.white.withValues(alpha: 0.2),
                dialHandColor: Colors.white.withAlpha(30),
                hourMinuteTextStyle: TextStyle(
                  fontFamily: fontRoboto,
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
                hourMinuteShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.white.withAlpha(60)),
                ),
                entryModeIconColor: kPrimaryColor,
                helpTextStyle: TextStyle(
                  fontFamily: fontRoboto,
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.02,
                ),
                dayPeriodShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                dayPeriodBorderSide: BorderSide(
                  color: Colors.white.withAlpha(60),
                ),
                dialBackgroundColor: Colors.white.withAlpha(40),
                dialTextStyle: TextStyle(
                  fontFamily: fontRoboto,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor,
                ),
                dialTextColor: kPrimaryColor,
                dayPeriodTextColor: Colors.white,
                dayPeriodColor: Colors.white.withValues(alpha: 0.2),
                dayPeriodTextStyle: TextStyle(
                  fontFamily: fontRoboto,
                  fontSize: 14,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),
                cancelButtonStyle: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.white.withAlpha(40)),
                  ),
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                confirmButtonStyle: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.white.withAlpha(40)),
                  ),
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ),
            child: TimePickerDialog(
              cancelText: "CANCEL",
              confirmText: "OK",
              initialTime: selectedTime,
              initialEntryMode: TimePickerEntryMode.dialOnly,
            ),
          ),
        ),
      ),
    );
  }
}
