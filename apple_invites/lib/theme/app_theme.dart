import 'package:apple_invites/core/colors/colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: kPrimaryColor,
    onPrimary: kTextColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.red, // avoid warning
    elevation: 8,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);

final ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
