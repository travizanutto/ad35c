import 'package:flutter/material.dart';

class ProfileModel {
  final String id;
  final String email;
  final String? username;
  Image? image;

  ProfileModel({
    required this.id,
    required this.email,
    this.username,
    required this.image,
  });
}
