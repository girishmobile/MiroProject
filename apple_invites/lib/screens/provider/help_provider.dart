import 'package:flutter/material.dart';

class HelpProvider extends ChangeNotifier {
  bool noReportYet = true;
  bool noSupportYet = true;

  void setIsReportYet(bool val) {
    noReportYet = val;
    notifyListeners();
  }

  void setIsSupportYet(bool val) {
    noSupportYet = val;
    notifyListeners();
  }
}
