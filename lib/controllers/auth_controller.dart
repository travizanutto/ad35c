import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vwalltet/pages/home_page.dart';
import 'package:vwalltet/services/auth_service.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLogin = true.obs;
  var isLoading = false.obs;
  var title = 'Login'.obs;
  var toggleButtonTitle = 'Registrar'.obs;
  var buttonTitle = 'ENTRAR'.obs;

  AuthController() {
    if (kDebugMode) {
      email.text = 'a@a.com';
      password.text = '123456';
      login();
    }
  }

  login() async {
    isLoading.value = true;
    try {
      await AuthService.to.login(email.text, password.text);
      Get.off(() => HomePage());
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  signUp() async {
    isLoading.value = true;
    try {
      await AuthService.to.newUser(email.text, password.text);
      Get.off(() => HomePage());
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  toggleLoginRegister() {
    isLogin.value = !isLogin.value;
    title.value = isLogin.value ? 'Login' : 'Cadastro';
    toggleButtonTitle.value = isLogin.value ? 'Registrar' : 'Entrar';
    buttonTitle.value = isLogin.value ? 'ENTRAR' : 'CADASTRAR';
  }
}
