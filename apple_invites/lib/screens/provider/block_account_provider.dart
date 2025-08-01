import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:flutter/material.dart';

class BlockAccountProvider extends ChangeNotifier {
  bool _isEmptyList = true;

  bool get isEmptyList => _isEmptyList;

  final List<ContactModel> listOfBlockAccount = [];

  void setIsEmptyList(bool value) {
    _isEmptyList = value;
    notifyListeners();
  }

  void addBlockUser(ContactModel contact) {
    listOfBlockAccount.add(contact);
    if (listOfBlockAccount.isNotEmpty) {
      _isEmptyList = false;
    }
    notifyListeners();
  }

  void removeBlockUser(ContactModel contact) {
    listOfBlockAccount.remove(contact);
    if (listOfBlockAccount.isEmpty) {
      _isEmptyList = true;
    }
    notifyListeners();
  }
}
