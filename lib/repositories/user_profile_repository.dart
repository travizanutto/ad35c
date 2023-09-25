import '../models/profile_model.dart';

class UserProfileRepository {
  // Simula um banco de dados fictício
  final Map<String, ProfileModel> _userProfiles = {};

  // Método para buscar o perfil do usuário por ID
  ProfileModel? getUserProfileById(String userId) {
    return _userProfiles[userId];
  }

  // Método para salvar ou atualizar o perfil do usuário
  void saveUserProfile(ProfileModel userProfile) {
    _userProfiles[userProfile.id] = userProfile;
  }

  // Método para verificar se um perfil de usuário existe
  bool doesUserProfileExist(String userId) {
    return _userProfiles.containsKey(userId);
  }
}
