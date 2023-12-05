import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vwalltet/models/profile_model.dart';
import 'package:vwalltet/services/auth_service.dart';

class ProfileController extends GetxController {
  static final _instance = ProfileController._internal();
  late Rx<ProfileModel> _user;

  ProfileController._internal();

  factory ProfileController() {
    return _instance;
  }

  @override
  onInit() {
    super.onInit();
    var user = AuthService.user;

    _user = Rx<ProfileModel>(ProfileModel(
      id: user!.uid,
      email: user.email!,
      image: Image.asset('assets/icons/icon.png', height: 80.0, width: 80.0,)
    ));
  }

  ProfileModel get user => _user.value;

  static Future<void> pickImage() async {
    await _instance.pickImageInstance();
  }

  Future<void> pickImageInstance() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _user.value.image = Image.file(File(pickedFile.path));
      _user.refresh();
    }
  }
}
