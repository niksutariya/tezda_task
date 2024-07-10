import 'package:get_storage/get_storage.dart';

class AppSharedPreference {
  static final _getStorage = GetStorage();

  static const _isLogin = 'is_login';
  static const _profileImagePath = 'profile_image_path';
  static const _email = 'email';
  static const _userName ='user_name';

  static Future<void> setIsLogin(bool? isLogin) async =>
      _getStorage.write(_isLogin, isLogin);

  static bool? get isLogin => _getStorage.read(_isLogin);

  static Future<void> setProfileImagePath(String? profileImagePath) async =>
      _getStorage.write(_profileImagePath, profileImagePath);

  static String? get profileImagePath => _getStorage.read(_profileImagePath);

  static Future<void> setEmail(String? email) async =>
      _getStorage.write(_email, email);

  static String? get email => _getStorage.read(_email);

  static Future<void> setUserName(String? userName) async =>
      _getStorage.write(_userName, userName);

  static String? get userName => _getStorage.read(_userName);

  static Future<void> clear() async => _getStorage.erase();
}
