import 'package:flutter/material.dart';

class ProfileModel {
  final String id;
  final String email;
  final String? username;
  Image image = Image.asset('assets/icons/icon.png');

  ProfileModel({required this.id, required this.email, this.username});
}
