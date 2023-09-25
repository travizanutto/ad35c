import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../pages/edit_profile_page.dart';
import './home_page.dart';

class ProfilePage extends StatefulWidget {
  final UserProfile userProfile;

  ProfilePage({required this.userProfile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserProfile userProfile;

  @override
  void initState() {
    super.initState();
    userProfile = widget.userProfile; // Inicialize userProfile no initState
  }

  // Função para atualizar userProfile quando retornar da página de edição de perfil
  void updateProfile(UserProfile updatedProfile) {
    setState(() {
      userProfile = updatedProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: const Color(CustomColor.pompAndPower),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Foto de Perfil
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage(widget.userProfile.profileImageUrl),
                backgroundColor: const Color(CustomColor.EASports),
              ),
            ),

            // 2. Nome do Usuário
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.userProfile.username,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 3. Informações de Contato
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Email: ${widget.userProfile.email}\nTelefone: ${widget.userProfile.phoneNumber}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),

            // 4. Biografia ou Descrição
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.userProfile.bio,
                style: TextStyle(fontSize: 16.0),
              ),
            ),

            // 5. Estatísticas
            Padding(
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
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Navegue para a tela de edição de perfil e aguarde os novos dados
                  UserProfile? updatedProfile = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(userProfile: userProfile),
                    ),
                  );

                  // Verifique se há dados atualizados e atualize a interface do usuário
                  if (updatedProfile != null) {
                    updateProfile(updatedProfile);
                  }
                },
                // Cor do botão
                style: ElevatedButton.styleFrom(
                  primary: Color(CustomColor.pompAndPower), // Cor do fundo do botão
                  onPrimary: Colors.white, // Cor do texto do botão
                ),
                child: Text('Editar Perfil'),
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
