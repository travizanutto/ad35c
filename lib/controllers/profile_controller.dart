import 'package:get/get.dart';
import 'package:vwalltet/models/profile_model.dart';
import 'package:vwalltet/services/auth_service.dart';

class ProfileController {
  static final _instance = ProfileController().obs;
  static var _singleton = false;
  late final ProfileModel _user;

  ProfileController() {
    if (!_singleton) {
      _singleton = true;
      var user = AuthService().user;
      _instance.value._user = ProfileModel(id: user!.uid, email: user.email!);
    }
  }

  static ProfileModel get user => _instance.value._user;
}
