import 'package:get/get.dart';
import 'package:vwalltet/models/profile_model.dart';
import 'package:vwalltet/services/auth_service.dart';

import 'dart:io';

class ProfileController extends GetxController {
  static final _instance = ProfileController();
  late Rx<ProfileModel> _user;

  @override
  onInit() {
    super.onInit();
    var user = AuthService.user;

    _instance._user = Rx<ProfileModel>(
      ProfileModel(
        id: user!.uid,
        email: user.email!,
        image: File(''),
        defaultImagePath: 'assets/icons/icon.png',
      ),
    );
  }

  static ProfileModel get user => _instance._user.value;

  static Future<void> pickImage() async {
    await _instance._user.value.pickImage();
    _instance._user.refresh();
  }
}
