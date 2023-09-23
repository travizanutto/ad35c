import '../models/profile.dart';

class UserProfileRepository {
  // Simula um banco de dados fictício
  final Map<String, UserProfile> _userProfiles = {};

  // Método para buscar o perfil do usuário por ID
  UserProfile? getUserProfileById(String userId) {
    return _userProfiles[userId];
  }

  // Método para salvar ou atualizar o perfil do usuário
  void saveUserProfile(UserProfile userProfile) {
    _userProfiles[userProfile.id] = userProfile;
  }

  // Método para verificar se um perfil de usuário existe
  bool doesUserProfileExist(String userId) {
    return _userProfiles.containsKey(userId);
  }
}