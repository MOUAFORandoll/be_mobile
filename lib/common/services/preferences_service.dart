import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:potatoes_secured_preferences/potatoes_secured_preferences.dart';
import 'package:BabanaExpress/common/models/user.dart';

class PreferencesService extends SecuredPreferencesService {
  static const String _keyUser = 'user';
  static const String _keyUserUID = 'user_id';
  static const String _keyAuthToken = 'auth_token';

  const PreferencesService(super.preferences, super.secureStorage);

  User? get user {
    final value = preferences.getString(_keyUser);

    if (value == null) return null;
    return User.fromJson(jsonDecode(value) as Map<String, dynamic>);
  }

  Future<void> saveUser(User user) {
    return Future.wait([
      preferences.setString(_keyUserUID, user.id.toString()),
      preferences.setString(_keyUser, jsonEncode(user)),
    ]);
  }

  Future<void> saveAuthToken(String token) {
    return secureStorage.write(key: _keyAuthToken, value: token);
  }

  @override
  FutureOr<Map<String, String>> getAuthHeaders() async {
    return {
      'Authorization': 'Bearer ${await secureStorage.read(key: _keyAuthToken)}'
    };
  }
}
