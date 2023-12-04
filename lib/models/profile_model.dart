import 'dart:io';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class ProfileModel extends GetxController {
  final String id;
  final String email;
  final String? username;
  File? image;
  final String defaultImagePath;

  ProfileModel({
    required this.id,
    required this.email,
    this.username,
    this.image,
    required this.defaultImagePath,
  }) {
    if (image == null || image!.path.isEmpty) {
      image = File(defaultImagePath);
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      this.refresh();
    }
  }
}
