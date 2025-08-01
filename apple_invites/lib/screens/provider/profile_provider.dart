import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String _name = "Sophia Moore";
  String _email = "sophia@example.com";
  String _phoneNumber = "123-456-7890";
  String _birthday = "01/01/2000";
  String _profileImageUrl =
      "https://images.unsplash.com/photo-1615717108468-eac48e85381b?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  String get name => _name;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get birthday => _birthday;
  String get profileImageUrl => _profileImageUrl;

  //Manage Account
  bool showPersonalInfo = false;
  bool showContactSync = false;
  bool hasContactSync = false;

  void updateProfile(
    String name,
    String email,
    String phoneNumber,
    String birthday,
  ) {
    _name = name;
    _email = email;
    _phoneNumber = phoneNumber;
    _birthday = birthday;
    notifyListeners();
  }

  void setProfileImage(String imageUrl) {
    _profileImageUrl = imageUrl;
    notifyListeners();
  }

  void setShowPersonalInfo(bool value) {
    showPersonalInfo = value;
    notifyListeners();
  }

  void setShowContactSync(bool value) {
    showContactSync = value;
    notifyListeners();
  }

  void setIsContactSyncing(bool val) {
    hasContactSync = val;
    notifyListeners();
  }
}
