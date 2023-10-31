import 'package:get/get.dart';
import 'package:vwalltet/models/profile_model.dart';
import 'package:vwalltet/services/auth_service.dart';

class ProfileController extends GetxController {
  static final _instance = ProfileController();
  late Rx<ProfileModel> _user;

  @override
  onInit() {
    super.onInit();
    var user = AuthService.user;
    _instance._user = ProfileModel(id: user!.uid, email: user.email!).obs;
  }

  static ProfileModel get user => _instance._user.value;
}
