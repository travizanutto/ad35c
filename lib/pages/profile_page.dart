import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vwalltet/controllers/profile_controller.dart';
import '../controllers/profile_controller.dart';
import '../models/profile_model.dart';
import '../pages/edit_profile_page.dart';
import './home_page.dart';

class ProfilePage extends StatefulWidget {
  final ProfileController = Get.find<ProfileController>();
  ProfileModel userProfile = profileController.userProfile.value;

  const ProfilePage({super.key, required this.userProfile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileModel userProfile;

  @override
  void initState() {
    super.initState();
    userProfile = widget.userProfile; // Inicialize userProfile no initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Perfil'),
        backgroundColor: const Color(CustomColor.delftBlue),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Foto de Perfil
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const CircleAvatar(
                radius: 60.0,

                // bug
                //backgroundImage: AssetImage(widget.userProfile.profileImageUrl),
                backgroundColor: Color(CustomColor.eASports),
              ),
            ),

            // 2. Nome do Usuário
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.userProfile.username,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 3. Informações de Contato
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Email: ${widget.userProfile.email}\nTelefone: ${widget.userProfile.phoneNumber}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),

            // 4. Biografia ou Descrição
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.userProfile.bio,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),

            // 5. Estatísticas
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Você pode remover completamente esta parte.
                ],
              ),
            ),

            // 6. Ações Editáveis (Editar Perfil)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Navegue para a tela de edição de perfil e aguarde os novos dados
                  ProfileModel? updatedProfile = await Get.to(() => EditProfilePage(userProfile: userProfile,));

                  // Verifique se há dados atualizados e atualize a interface do usuário
                  if (updatedProfile != null) {
                    profileController.updatedProfile(updatedProfile);
                  }
                },
                // Cor do botão
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(CustomColor.delftBlue), // Cor do fundo do botão
                  foregroundColor: Colors.white, // Cor do texto do botão
                ),
                child: const Text('Editar Perfil'),
              ),
            )

            // 8. Configurações do Perfil

            // 9. Botão de Logout

            // 10. Navegação (barra de navegação ou guias)
          ],
        ),
      ),
    );
  }
}
