import 'package:apple_invites/screens/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  void updateImageUrl(String newUrl) {
    if (_user != null) {
      _user = _user!.copyWith(imageUrl: newUrl);
      notifyListeners();
    }
  }

  void updateUserProfile(
    String newName,
    String newEmail,
    String newMobile,
    String newBirthDay,
  ) {
    if (_user != null) {
      _user = _user!.copyWith(
        name: newName,
        email: newEmail,
        mobileNumber: newMobile,
        dateOfBirth: newBirthDay,
      );
      notifyListeners();
    }
  }
}

final sampleUser = UserModel(
  email: "emilyjackson@example.com",
  name: "Emily Jackson",
  mobileNumber: "+91 9558697986",
  dateOfBirth: "01-Feb-1990",
  imageUrl:
      "https://images.unsplash.com/photo-1572431862804-10af7b9c2830?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTAzN3x8cHJvZmlsZSUyMGdpcmx8ZW58MHwyfDB8fHww",
);
