import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'home_page.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfile userProfile;

  EditProfilePage({required this.userProfile});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class _EditProfilePageState extends State<EditProfilePage> {
  // Variáveis para controlar os campos de edição
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();

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
        backgroundColor: const Color(CustomColor.pompAndPower),
      ),
      body: Form(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16.0), // Espaçamento acima do campo "Nome de Usuário"
                child: TextFormField(
                  controller: usernameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nome de Usuário',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(CustomColor.pompAndPower)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0), // Espaçamento acima do campo "Email"
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(CustomColor.pompAndPower)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0), // Espaçamento acima do campo "Número de Telefone"
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Número de Telefone',
                    hintText: '(___)________',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(CustomColor.pompAndPower)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    // Define o mínimo de caracteres
                    counterText: '', // Remove o contador de caracteres padrão
                    counterStyle: const TextStyle(fontSize: 0), // Remove o estilo do contador de caracteres
                    helperText: 'Mínimo e máximo de 12 caracteres', // Mensagem de ajuda
                    helperStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  maxLength: 12, // Define o número máximo de caracteres
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo é obrigatório';
                    } else if (value.length < 12) {
                      return 'Mínimo de 12 caracteres';
                    } else if (value.length > 12) {
                      return 'Máximo de 12 caracteres';
                    }
                    return null; // Retorna null se a validação for bem-sucedida
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0), // Espaçamento acima do campo "Biografia"
                child: TextFormField(
                  controller: bioController,
                  decoration: InputDecoration(
                    labelText: 'Biografia',
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(CustomColor.pompAndPower)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String newUsername = usernameController.text.trim();
                  String newEmail = emailController.text.trim();
                  String newPhoneNumber = phoneNumberController.text.trim();
                  String newBio = bioController.text.trim();

                  // Crie uma nova instância de UserProfile com os dados atualizados
                  UserProfile updatedProfile = UserProfile(
                    id: widget.userProfile.id,
                    username: newUsername,
                    email: newEmail,
                    phoneNumber: newPhoneNumber,
                    bio: newBio,
                    profileImageUrl: widget.userProfile.profileImageUrl,
                  );

                  // Verificação de erros
                  if (newUsername.isEmpty || newEmail.isEmpty || newPhoneNumber.isEmpty) {
                    // Exibe um SnackBar informando ao usuário que os campos são obrigatórios.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, preencha todos os campos obrigatórios.'),
                      ),
                    );
                    return;
                  }
                  // Validação de comprimento mínimo e máximo
                  if (newUsername.length < 3 || newUsername.length > 20) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('O nome de usuário deve ter entre 3 e 20 caracteres.'),
                      ),
                    );
                    return;
                  }
                  // Função para verificar se o caractere é numérico
                  bool isNumeric(String str) {
                    if (str == null) return false;
                    return double.tryParse(str) != null;
                  }
                  String username = usernameController.text;

                  // Verifica se o nome de usuário tem pelo menos 3 caracteres não numéricos
                  int nonNumericCount = 0;
                  for (int i = 0; i < username.length; i++) {
                    if (!isNumeric(username[i])) nonNumericCount++;
                  }

                  if (nonNumericCount < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('O nome de usuário deve ter pelo menos 3 caracteres não numéricos.'),
                      ),
                    );
                    return;
                  }
                  bool isEmailValid(String email) {
                    // Padrão de regex para verificar o formato de um email
                    final emailRegExp = RegExp(
                      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                    );

                    // Use o método test do RegExp para verificar se o email coincide com o padrão
                    return emailRegExp.hasMatch(email);
                  }
                  String email = emailController.text;

                  if (!isEmailValid(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('O email inserido não é válido.'),
                      ),
                    );
                    return;
                  }

                  bool isValidPhoneNumber(String phoneNumber) {
                    // Crie uma expressão regular para o formato "(123)912345678"
                    final RegExp phoneRegex = RegExp(r'^\d{12}$');

                    // Use a expressão regular para verificar o número de telefone
                    return phoneRegex.hasMatch(phoneNumber);
                  }

                  if (!isValidPhoneNumber(newPhoneNumber)) {
                    // Exiba uma mensagem de erro para o usuário informando que o número de telefone é inválido.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, insira um número no formato (123)912345678.'),
                      ),
                    );
                    return; // Retorna para evitar que o código continue a ser executado.
                  }

                  // Atualiza o perfil
                  widget.userProfile.username = newUsername;
                  widget.userProfile.email = newEmail;
                  widget.userProfile.phoneNumber = newPhoneNumber;
                  widget.userProfile.bio = newBio;

                  // Retorna os novos dados do perfil para a página anterior
                  setState(() {});

                  // Navegue de volta para a tela de perfil
                  Navigator.pop(context, updatedProfile);
                },
                // Cor do botão
                style: ElevatedButton.styleFrom(
                  primary: Color(CustomColor.pompAndPower), // Cor do fundo do botão
                  onPrimary: Colors.white, // Cor do texto do botão
                ),
                child: Text('Salvar Alterações'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}