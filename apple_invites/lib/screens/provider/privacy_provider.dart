import 'package:flutter/material.dart';

class PrivacyProvider extends ChangeNotifier {
  bool hasPrivateAc = true;
  bool hasSaveInfo = false;

  void setIsPrivateAccount(bool value) {
    hasPrivateAc = value;
    notifyListeners();
  }

  void setIsSaveInfo(bool value) {
    hasSaveInfo = value;
    notifyListeners();
  }
}
