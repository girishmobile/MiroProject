import 'package:flutter/material.dart';

class PaymentProvider extends ChangeNotifier {
  bool isEmptyPayment = true;

  void setIsEmptyPayment(bool value) {
    isEmptyPayment = value;
    notifyListeners();
  }
}
