import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isLoading = false.obs;

  User? get user => _auth.currentUser;
  static AuthService get to => Get.find();

  showSnack(String titulo, String erro) {
    Get.snackbar(
      titulo,
      erro,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  newUser(String email, String password) async {
    isLoading.value = true;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      showSnack('Erro ao criar usuário.', '$e');
    }
    isLoading.value = false;
  }

  login(String email, String password) async {
    isLoading.value = true;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      showSnack('Erro ao logar.', '$e');
    }
    isLoading.value = false;
  }

  signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      showSnack('ERRO', '$e');
    }
  }
}
