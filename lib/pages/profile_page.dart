import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/profile.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile userProfile;

  ProfilePage({required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
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
                // backgroundImage: AssetImage(userProfile.profileImageUrl),
                // PADILHA ARRUMA ISSO TA TRAVANDO O APP
              ),
            ),

            // 2. Nome do Usuário
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                userProfile.username,
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
                'Email: ${userProfile.email}\nTelefone: ${userProfile.phoneNumber}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),

            // 4. Biografia ou Descrição
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                userProfile.bio,
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
                onPressed: () {
                  // Adicionar ação para editar o perfil aqui
                },
                child: Text('Editar Perfil'),
              ),
            ),

            // 8. Configurações do Perfil

            // 9. Botão de Logout

            // 10. Navegação (barra de navegação ou guias)
          ],
        ),
      ),
    );
  }
}
