import 'package:apple_invites/screens/models/display_model.dart';

class ContactModel implements DisplayModel {
  @override
  final String name;
  final String phoneNumber;
  final String? email;
  final String? profilePic;
  final String? description;

  ContactModel({
    required this.name,
    required this.phoneNumber,
    this.email,
    this.profilePic,
    this.description,
  });

  @override
  String get imageUrl => profilePic ?? '';

  @override
  String get title => name;

  @override
  String get subtitle => description ?? phoneNumber;
}
