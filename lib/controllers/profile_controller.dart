import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:vwalltet/models/profile_model.dart';

class ProfileController extends GetxController {
  var userProfile = ProfileModel(
    id: 'initialId',
    username: 'initialUsername',
    email: 'initialEmail',
    phoneNumber: 'initialPhoneNumber',
    bio: 'initialBio',
    profileImageUrl: 'initialImageUrl',
    ).obs;

  void updateProfile(ProfileModel updatedProfile) {
    userProfile.value = updatedProfile;
  }

  static bool isUsernameSizeValid(String username) {
    return username.length >= 3 && username.length <= 20;
  }

  static bool countNonNumericCharacters(String value) {
    int nonNumericCount = 0;
    for (int i = 0; i < value.length; i++) {
      if (!isNumeric(value[i])) nonNumericCount++;
    }
    return nonNumericCount >= 3;
  }

  static bool isEmailValid(String email) {
    email = email.trim();
    final emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\d{12}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  static bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
