import 'dart:ui';

import 'package:apple_invites/core/common/app_glass_calendar.dart';
import 'package:apple_invites/core/common/app_glass_timer.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/common/custom_calendar.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/provider/event_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

final ImagePicker _picker = ImagePicker();

loadAssetImage({
  required String name,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
}) {
  return Image.asset(name, width: width, height: height, fit: fit);
}

loadNetworkImage({
  required String imageUrl,
  double width = double.infinity,
  double height = 100,
  BoxFit fit = BoxFit.cover,
}) {
  if (imageUrl.trim().isEmpty) {
    return Container(
      alignment: Alignment.center,
      height: photoSize,
      child: Text(
        "No image",
        style: TextStyle(
          fontFamily: fontRoboto,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
  return imageUrl.startsWith('http')
      ? Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return _fallBackContent(null, null, "?");
        },
      )
      : loadAssetImage(
        name: imageUrl,
        fit: BoxFit.cover,
        height: height,
        width: width,
      );
}

LinearGradient appGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Colors.white.withValues(alpha: 0.1),
    Colors.white.withValues(alpha: 0.05),
  ],
);

loadTitleText({
  String? title,
  double? fontSize,
  Color? fontColor,
  FontWeight? fontWight,
  TextAlign? textAlign,
  TextOverflow? textOverflow,
}) {
  return Text(
    title ?? "",
    style: TextStyle(
      color: fontColor ?? Colors.white.withValues(alpha: 1),
      fontFamily: fontRoboto,
      fontSize: fontSize ?? 16,
      fontWeight: fontWight ?? FontWeight.w700,
    ),
    textAlign: textAlign ?? TextAlign.left,
    overflow: textOverflow,
  );
}

loadSubTitleText({
  String? title,
  Color? fontColor,
  double? fontSize,
  TextAlign? textAlign,
  TextOverflow? textOverflow,
  int? maxLines,
}) {
  return Text(
    title ?? "",
    style: TextStyle(
      color: fontColor ?? Colors.white,
      fontFamily: fontRoboto,
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w500,
    ),
    textAlign: textAlign ?? TextAlign.start,
    overflow: textOverflow,
    maxLines: maxLines,
  );
}

loadGlassBackground({
  required Widget child,

  double? leftMargin,
  double? rightMargin,
  double? topMargin,
  double? bottomMargin,
  double? leftPadding,
  double? rightPadding,
  double? topPadding,
  double? bottomPadding,
  double? borderRadius,

  Key? key,
}) {
  return ClipRRect(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    borderRadius: BorderRadius.circular(borderRadius ?? 8),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        key: key,
        margin: EdgeInsets.fromLTRB(
          leftMargin ?? 16,
          topMargin ?? 0,
          rightMargin ?? 16,
          bottomMargin ?? 8,
        ),
        padding: EdgeInsets.fromLTRB(
          leftPadding ?? 16,
          topPadding ?? 16,
          rightPadding ?? 16,
          bottomPadding ?? 16,
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: Border.all(color: Colors.white.withAlpha(40)),
          gradient: appGradient,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withValues(alpha: 0.2),
          //     blurRadius: 10,
          //     blurStyle: BlurStyle.normal,
          //     offset: Offset(0, 4),
          //   ),
          // ],
        ),
        child: child,
      ),
    ),
  );
}

loadRowWithIcon({
  required String title,
  IconData? iconName,
  double? fontSize,
  TextAlign? textAlign,
  Color? fontColor,
  double? iconSize,
  FontWeight? fontWeight,
  Color? iconColor,
}) {
  return Row(
    spacing: 8,
    children: [
      iconName != null
          ? Icon(
            iconName,
            color: iconColor ?? Colors.white,
            size: iconSize ?? 28,
          )
          : SizedBox.shrink(),
      Expanded(
        child: Text(
          title,
          textAlign: textAlign ?? TextAlign.start,
          style: TextStyle(
            color: fontColor ?? Colors.white,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize ?? 16,
            fontFamily: fontRoboto,
          ),
        ),
      ),
    ],
  );
}

loadGlassButton({
  required String text,
  required VoidCallback onPress,
  Color? textColor,
  Color? borderColor,
  double? fontSize,
  double? iconSize,
  IconData? icon,
  double horizontalPadding = 16,
  double verticalPadding = 12,
  FontWeight? fontWeight = FontWeight.w600,
}) {
  return ClipRRect(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor ?? Colors.white.withAlpha(40)),
          gradient: appGradient,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPress,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(
                      icon,
                      color: textColor ?? Colors.white,
                      size: iconSize ?? 24,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Flexible(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        fontWeight: fontWeight,
                        fontSize: fontSize ?? 16,
                        color: textColor ?? Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

loadStaticGlassBtn({
  required String text,
  required VoidCallback onPress,
  double? fontSize,
  double horizontalPadding = 16,
  double verticalPadding = 12,
  FontWeight? fontWeight = FontWeight.w600,
}) {
  return ClipRRect(
    clipBehavior: Clip.antiAlias,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withAlpha(40)),
          gradient: appGradient,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPress,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: fontRoboto,
                        fontWeight: fontWeight,
                        fontSize: fontSize ?? 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

loadUnderLineWithText({String text = ""}) {
  return IntrinsicWidth(
    child: Column(
      spacing: 0,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.9),
            fontFamily: fontRoboto,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        //SizedBox(height: 1),
        Container(height: 0.75, color: Colors.white.withValues(alpha: 0.7)),
      ],
    ),
  );
}

loadTextField({
  String? text, // 👈 ADD THIS
  String? hintText,
  TextStyle? hintStyle,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Color? bgColor,
  bool? readOnly = false,
  ValueChanged<String>? onChanged,
  VoidCallback? onTaped,
}) {
  final controller = TextEditingController(text: text ?? '');

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    decoration: BoxDecoration(
      color: bgColor ?? Colors.white.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.white.withAlpha(30)),
      gradient: appGradient,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        prefixIcon != null
            ? Icon(
              prefixIcon,
              size: 20,
              color: Colors.white.withValues(alpha: 0.6),
            )
            : const SizedBox.shrink(),
        Expanded(
          child: TextField(
            controller: controller, // ✅ Set the controller
            onChanged: onChanged,
            onTap: onTaped,
            style: TextStyle(
              color: Colors.white,
              fontFamily: fontRoboto,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.1,
            ),
            decoration: InputDecoration(
              hintText: hintText ?? "",
              hintStyle:
                  hintStyle ??
                  TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
              border: InputBorder.none,
            ),
            readOnly: readOnly ?? false,
          ),
        ),
        suffixIcon != null
            ? InkWell(
              onTap: onTaped,
              child: Icon(
                suffixIcon,
                size: 20,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            )
            : const SizedBox.shrink(),
      ],
    ),
  );
}

loadRichText({required String textMsg}) {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.white.withValues(alpha: 0.7),
        fontFamily: fontRoboto,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        letterSpacing: 1.02,
      ),
      children: [
        TextSpan(
          text:
              'Information about your device, account, and this app related to the issue that you are reporting will be automatically included in this report in order to help us understand and resolve the issue.\n\nYou can decide at any time not to send complete logs and diagnostics if you turn the toggle to "off". We will not use the information contained in this report for other purposes.',
        ),
        TextSpan(
          text: "Learn more",
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue,
            fontFamily: fontRoboto,
            fontWeight: FontWeight.w700,
            // decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = () {},
        ),
      ],
    ),
  );
}

loadMultiLineTextField({
  Color? bgColor,
  String? hintText,
  TextEditingController? textController,
  int? maxLine,
  int? minLine,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    decoration: BoxDecoration(
      color: bgColor ?? Colors.white.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.white.withAlpha(30)),
      gradient: appGradient,
    ),
    child: TextField(
      keyboardType: TextInputType.multiline,
      controller: textController,
      maxLines: maxLine ?? 7,
      minLines: minLine ?? 3,
      style: TextStyle(
        color: Colors.white,
        fontFamily: fontRoboto,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.1,
      ),
      decoration: InputDecoration(
        hintText: hintText ?? 'Enter your message...',
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.6),
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        border: InputBorder.none,
      ),
    ),
  );
}

loadDivider() {
  return Divider(
    thickness: 0.75,
    color: Colors.white.withValues(alpha: 0.25),
    height: 0,
  );
}

loadCircleIcon({
  IconData? icon,
  double? radius = 20,
  double? iconSize = 20,
  VoidCallback? onTap,
  Color? iconColor = Colors.white,
  String? text,
  Color? backgroundColor,
  Color? borderColor,
}) {
  return Material(
    color: Colors.transparent,
    shape: CircleBorder(
      side: BorderSide(
        color: borderColor ?? Colors.white.withAlpha(30),
        width: 1,
      ),
    ),
    child: InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: CircleAvatar(
        radius: radius ?? 20,
        backgroundColor: backgroundColor ?? Colors.white.withAlpha(40),
        child: Container(
          child:
              icon != null
                  ? Icon(icon, color: iconColor, size: iconSize)
                  : Text(
                    (text != null && text.isNotEmpty)
                        ? text[0].toUpperCase()
                        : "?",
                    style: TextStyle(
                      color: iconColor,
                      fontFamily: fontRoboto,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
        ),
      ),
    ),
  );
}

loadCircleImage({
  IconData? icon,
  double radius = 24,
  double? iconSize = 20,
  VoidCallback? onTap,
  Color? iconColor = Colors.white,
  String? text,
  Color? backgroundColor,
  String? imageUrl,
}) {
  return Material(
    color: Colors.transparent,
    shape: CircleBorder(
      side: BorderSide(color: Colors.white.withValues(alpha: 0.4), width: 1),
    ),
    child: InkWell(
      splashColor: Colors.transparent,

      customBorder: const CircleBorder(),
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.white.withAlpha(40),
        child:
            imageUrl != null && imageUrl.isNotEmpty
                ? ClipOval(
                  child:
                      imageUrl.startsWith('http')
                          ? Image.network(
                            imageUrl,
                            width: radius * 2,
                            height: radius * 2,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return _fallBackContent(icon, iconColor, text);
                            },
                          )
                          : loadAssetImage(
                            name: imageUrl,
                            fit: BoxFit.cover,
                            width: radius * 2,
                            height: radius * 2,
                          ),
                )
                : _fallBackContent(icon, iconColor, text),
      ),
    ),
  );
}

Widget _fallBackContent(IconData? icon, Color? iconColor, String? text) {
  return icon != null
      ? Icon(icon, color: iconColor ?? Colors.white, size: 20)
      : Text(
        (text != null && text.isNotEmpty) ? text[0].toUpperCase() : "?",
        style: TextStyle(
          color: iconColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          fontFamily: fontRoboto,
        ),
      );
}

void showAlertWithGlassEffect({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
  String? leftbuttonText,
  String? rightbuttonText,
  bool isSingleBtn = false,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                gradient: appGradient,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    message,
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  isSingleBtn
                      ? ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 140),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: _buttonStyle(),
                          child: Text(
                            leftbuttonText ?? "NO",
                            style: _buttonTextStyle(),
                          ),
                        ),
                      )
                      : Row(
                        spacing: 12,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: _buttonStyle(),
                              child: Text(
                                leftbuttonText ?? "NO",
                                style: _buttonTextStyle(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: onConfirm,
                              style: _buttonStyle(),
                              child: Text(
                                rightbuttonText ?? "YES",
                                style: _buttonTextStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

ButtonStyle _buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.white.withAlpha(40),
    shadowColor: Colors.transparent,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: Colors.white.withAlpha(80), width: 1),
    ),
    elevation: 4,
  );
}

TextStyle _buttonTextStyle() {
  return const TextStyle(
    color: Colors.white,
    fontFamily: fontRoboto,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}

void customGlassDialogWithChild({
  required BuildContext context,
  required Widget child,
}) {
  showDialog(
    context: context,
    useRootNavigator: true,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: appGradient,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: child,
            ),
          ),
        ),
      );
    },
  );
}

void showGlassCalendarDialog(
  BuildContext context, {
  required Function(DateTime) onDateSelected,
  required DateTime firstDay,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    builder: (ctx) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: AppGlassCalendar(
          onDateSelected: onDateSelected,
          firstDay: firstDay,
        ),
      );
    },
  );
}

void showBirthdayCalendar(
  BuildContext context, {
  required Function(DateTime) onDateSelected,
  required DateTime firstDay,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    builder: (ctx) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: CustomCalendar(),
      );
    },
  );
}

Future<void> showGlassTimeDialog(
  BuildContext context, {
  required ValueChanged<TimeOfDay> onTimeSelected,
}) async {
  final picked = await showDialog<TimeOfDay>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    barrierDismissible: true,
    builder: (ctx) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: AppGlassTimer(onTimeSelected: onTimeSelected),
      );
    },
  );
  if (picked != null) {
    onTimeSelected(picked);
  }
}

loadImageOrCamera(
  BuildContext context, {
  required Function(String filePath) onPhotoTap,
  required Function(String filePath) onCameraTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
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
      Text(
        'Choose from gallery or camera',
        style: TextStyle(
          color: Colors.white,
          fontFamily: fontRoboto,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.02,
        ),
      ),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              loadCircleIcon(
                icon: Icons.photo_outlined,
                iconSize: 28,
                radius: 28,
                onTap: () async {
                  Navigator.pop(context);
                  final image = await pickImageFromGallery();
                  if (image != null) {
                    onPhotoTap(image.path);
                  }
                },
              ),
              AppTextWidget(
                text: "Library",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              loadCircleIcon(
                icon: Icons.camera_alt_outlined,
                iconSize: 28,
                radius: 28,
                onTap: () async {
                  Navigator.pop(context);
                  final image = await pickImageFromCamera();
                  if (image != null) {
                    onCameraTap(image.path);
                  }
                },
              ),
              AppTextWidget(
                text: "Camera",
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 20),
      loadGlassButton(
        text: "CANCEL",
        fontSize: 14,
        onPress: () {
          Navigator.pop(context);
        },
      ),
      const SizedBox(height: 16),
    ],
  );
}

Future<File?> pickImageFromGallery() async {
  final pickedFile = await _picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 60,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

Future<File?> pickImageFromCamera() async {
  final pickedFile = await _picker.pickImage(
    source: ImageSource.camera,
    imageQuality: 60,
  );
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}

loadBottomSheetWithSafeArea({
  required BuildContext context,
  required Widget child,
}) {
  final mediaQuery = MediaQuery.of(context);
  final statusBarHeight = mediaQuery.padding.top;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.2),
    builder: (context) {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            constraints: BoxConstraints(
              maxHeight:
                  MediaQuery.of(context).size.height -
                  statusBarHeight, // dynamic and safe
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            ),
            child: child,
          ),
        ),
      );
    },
  );
}

appNavigatorPop(BuildContext context) async {
  await Future.delayed(Duration(milliseconds: 150));
  if (context.mounted) {
    Navigator.pop(context);
  }
}

Widget loadSwitchButton(BuildContext context, EventProvider provider) {
  return Theme(
    data: Theme.of(context).copyWith(
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStateProperty.all(
          Colors.white.withValues(alpha: 0.2),
        ),
      ),
    ),
    child: Switch(
      inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
      inactiveThumbColor: Colors.grey.shade200,
      activeTrackColor: Colors.white.withAlpha(40),
      activeColor: Colors.white,
      value: provider.isShareEvent,
      onChanged: (val) {
        provider.setIsSharedEvent(val);
      },
    ),
  );
}

Widget loadDynamicSwitchButton({
  required BuildContext context,
  required bool value,
  required Function(bool?) onChanged,
}) {
  return Theme(
    data: Theme.of(context).copyWith(
      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStateProperty.all(
          Colors.white.withValues(alpha: 0.2),
        ),
      ),
    ),
    child: Switch(
      inactiveTrackColor: Colors.white.withValues(alpha: 0.2),
      inactiveThumbColor: Colors.grey.shade200,
      activeTrackColor: Colors.white.withAlpha(40),
      activeColor: Colors.white,
      value: value,
      onChanged: onChanged,
    ),
  );
}

void showTopSnackBar(BuildContext context, Widget child) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder:
        (context) => Positioned(
          top: 0, //MediaQuery.of(context).padding.top + 16
          left: 0,
          right: 0,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                16,
                MediaQuery.of(context).padding.top + 16,
                16,
                16,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: child,
            ),
          ),
        ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

//17-July-2025
loadEmptyView({
  required IconData emptyIcon,
  required String title,
  required String message,
  required String buttonTitle,
  required VoidCallback onPressed,
}) {
  return Center(
    child: loadGlassBackground(
      leftMargin: 16,
      rightMargin: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(emptyIcon, color: Colors.white.withValues(alpha: 0.7), size: 36),
          const SizedBox(height: 16),
          loadTitleText(
            title: title,
            fontSize: 20,
            fontColor: Colors.white.withValues(alpha: 0.7),
          ),
          const SizedBox(height: 8),
          loadSubTitleText(
            textAlign: TextAlign.center,
            fontColor: Colors.white.withValues(alpha: 0.7),
            title: message,
          ),
          const SizedBox(height: 30),
          loadGlassButton(text: buttonTitle, onPress: onPressed),
        ],
      ),
    ),
  );
}

appSnackMessenger({required BuildContext context, required String message}) {
  final messenger = ScaffoldMessenger.of(context);
  messenger.showSnackBar(
    SnackBar(
      backgroundColor: Colors.black.withValues(alpha: 0.5),
      content: Text(
        message,
        style: TextStyle(
          fontFamily: fontRoboto,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    ),
  );
}

/** BUTTON
 * 
 *   final messenger = ScaffoldMessenger.of(context);

 * // messenger.hideCurrentSnackBar();
        // messenger.showSnackBar(
        //   SnackBar(
        //     behavior: SnackBarBehavior.floating,
        //     backgroundColor: Colors.black.withValues(alpha: 0.4),
        //     content: Text(
        //       val
        //           ? 'Allow guests to create shared event album ON'
        //           : 'Allow guests to create shared event album OFF',
        //       style: TextStyle(
        //         fontFamily: fontRoboto,
        //         fontWeight: FontWeight.w700,
        //         fontSize: 14,
        //         color: Colors.white,
        //       ),
        //     ),
        //     duration: Duration(seconds: 2),
        //   ),
        // );

 * ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: textColor ?? Colors.white,
                  size: fontSize ?? 24,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: TextStyle(
                  fontFamily: fontRoboto,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 16,
                  color: textColor ?? Colors.white,
                  letterSpacing: 1.02,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
 */
