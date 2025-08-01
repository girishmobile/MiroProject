import 'package:apple_invites/core/common/app_navigation_bar.dart';
import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/screens/qrcode/qr_scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQrCodePage extends StatelessWidget {
  const ScanQrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFancyScanner(context));
  }

  _buildFancyScanner(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Column(
            children: [
              Expanded(child: QrScannerPage()),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: loadGlassButton(
                  icon: Icons.qr_code_2,
                  text: "Go to your QR Code",
                  onPress: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          child: AppNavigationBar(
            title: "SCAN QR CODE",
            onLeftTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
