import 'dart:ui';

import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_text_widget.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/router/route_name.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyQRcode(context));
  }

  _buildFancyQRcode(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Center(
            child: loadGlassBackground(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  QrImageView(
                    data: "GIRISH CHAUHAN",
                    size: 200,
                    version: QrVersions.auto,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.black,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  loadTitleText(
                    title: "[John Doe]",
                    fontSize: 20,
                    fontWight: FontWeight.w700,
                    fontColor: Colors.white,
                  ),

                  const SizedBox(height: 30),
                  loadGlassButton(
                    icon: Icons.qr_code_scanner,
                    text: "Scan QR Code",
                    onPress: () {
                      Navigator.pushNamed(context, RouteName.scanQrCodePage);
                    },
                  ),
                  const SizedBox(height: 10),
                  AppTextWidget(
                    text: "Scan  QR code to get user details!",
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: AppNavigationBar(
            title: "QR CODE",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
