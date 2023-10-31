import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import 'package:vwalltet/models/profile_model.dart';
import 'package:vwalltet/pages/home_page.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileModel userProfile;

  const EditProfilePage({required this.userProfile, Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  final ProfileController profileController = Get.find();

  @override
  void initState() {
    super.initState();
    // Preenche os campos de edição com os dados atuais do perfil
    usernameController.text = widget.userProfile.username;
    emailController.text = widget.userProfile.email;
    phoneNumberController.text = widget.userProfile.phoneNumber;
    bioController.text = widget.userProfile.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      appBar: AppBar(
        title: const Text('Editar Perfil'),
        backgroundColor: const Color(CustomColor.delftBlue),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildTextFormField(
                controller: usernameController,
                label: 'Nome de Usuário',
                keyboardType: TextInputType.name,
                maxLength: 20,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildTextFormField(
                controller: emailController,
                label: 'Email',
                maxLength: 36,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  if (!isEmailValid(value)) {
                    return 'O email inserido não é válido.';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),   
                child: buildTextFormField(
                  controller: phoneNumberController,
                  label: 'Número de Telefone',
                  keyboardType: TextInputType.number,
                  hintText: '(___)_________',
                  maxLength: 12,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    if (!isValidPhoneNumber(value)) {
                      return 'Por favor, insira um número no formato (123)912345678.';
                    }
                    return null;
                  },
                ),
              ),           
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildTextFormField(
                controller: bioController,
                label: 'Biografia',
              ),
            ),
              ElevatedButton(
                onPressed: () {
                  String newUsername = usernameController.text;
                  String newEmail = emailController.text;
                  String newPhoneNumber = phoneNumberController.text;
                  String newBio = bioController.text;

                  // Validação de comprimento mínimo e máximo
                  if (!isUsernameSizeValid(newUsername)) {
                    showSnackBar('O nome de usuário deve ter entre 3 e 20 caracteres.');
                    return;
                  }
                  // Validação de caracteres não numéricos
                  if (!countNonNumericCharacters(newUsername)) {
                    showSnackBar('O nome de usuário deve ter pelo menos 3 caracteres não numéricos.');
                    return;
                  }
                  //Validação de email
                  if (!isEmailValid(newEmail)) {
                    showSnackBar('O email inserido não é válido.');
                    return;
                  }
                  // Validação de número de telefone
                  if (!isValidPhoneNumber(newPhoneNumber)) {
                    showSnackBar('Por favor, insira um número no formato (123)912345678.');
                    return;
                  }

                  // Atualiza o perfil utilizando o controlador
                  profileController.updateProfile(ProfileModel(
                    id: widget.userProfile.id,
                    username: newUsername,
                    email: newEmail,
                    phoneNumber: newPhoneNumber,
                    bio: newBio,
                    profileImageUrl: widget.userProfile.profileImageUrl,
                  ));

                  // Retorna os novos dados do perfil para a página anterior
                  Get.back(result: profileController.userProfile.value);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(CustomColor.delftBlue),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      );
  }

  TextFormField buildTextFormField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? hintText,
    int? maxLength,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(CustomColor.pompAndPower)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(2.0),
        ),
        hintText: hintText,
      ),
      maxLength: maxLength,
      validator: validator,
    );
  }

bool isUsernameSizeValid(String username) {
    if (username.length < 3) {
      return false;
    } else {
      return true;
    }
  }

  bool countNonNumericCharacters(String value) {
    int nonNumericCount = 0;
    for (int i = 0; i < value.length; i++) {
      if (!isNumeric(value[i])) nonNumericCount++;
    }
    if (nonNumericCount < 3) {
      return false;
    } else {
      return true;
    }
  }

  bool isEmailValid(String email) {
    email = email.trim();

    final emailRegExp = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegExp.hasMatch(email);
  }

  bool isValidPhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\d{12}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  bool isNumeric(String str) {
    return double.tryParse(str) != null;
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}