import 'dart:io';

class ProfileModel {
  final String id;
  final String email;
  final String? username;
  File? image;

  ProfileModel({
    required this.id,
    required this.email,
    this.username,
    this.image,
  }) {
    if (image == null || image!.path.isEmpty) {
      image = File('assets/icons/icon.png');
    }
  }
}
