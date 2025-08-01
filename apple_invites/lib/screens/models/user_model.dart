import 'package:uuid/uuid.dart';

final uuid = Uuid();

class UserModel {
  final String id;
  final String name;
  final String email;
  final String mobileNumber;
  final String? imageUrl;
  final String? dateOfBirth;
  UserModel({
    required this.name,
    required this.email,
    required this.mobileNumber,
    this.imageUrl,
    this.dateOfBirth,
    String? id,
  }) : id = id ?? uuid.v4();

  UserModel copyWith({
    final String? id,
    final String? name,
    final String? email,
    final String? mobileNumber,
    final String? imageUrl,
    final String? dateOfBirth,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
