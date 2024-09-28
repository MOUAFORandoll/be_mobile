import 'dart:developer';
import 'dart:io';

import 'package:BabanaExpress/common/models/auth_response.dart';
import 'package:BabanaExpress/common/models/send_user_response.dart';
import 'package:BabanaExpress/common/models/user.dart';
import 'package:BabanaExpress/common/models/verify_user_response.dart';
import 'package:path/path.dart';
import 'package:potatoes/auto_list/models/paginated_list.dart';
import 'package:potatoes/libs.dart';
import 'package:BabanaExpress/common/models/user.dart';
import 'package:BabanaExpress/common/models/exist_user_response.dart';
import 'package:BabanaExpress/common/services/api_service.dart';

class UserService extends ApiService {
  static const String _verify_user_exist = '/auth/user-exist-verify';
  static const _login = '/auth/user';
  static const String _getMe = '/users/me';
  static const String _authSocial = '/auth/user/social';
  static const String _sendCode = '/auth/user/send-code';
  static const String _verifyCode = '/auth/user/verify-code';
  static const String _newPassword = '/auth/user/new-password';
  static const String _register = '/auth/create-user';

  static const String _updateUser = '/users';
  static const String _updateProfilePicture = '/users/picture';
  static const String _logout = '/users/logout';

  const UserService(super._dio);

  Future<AuthResponse> getMe() {
    return compute(
        dio.get(
          _getMe,
          // options: Options(headers: withAuth()),
        ),
        mapper: AuthResponse.fromJson);
  }

  Future<AuthResponse> loginSocial({required user}) async {
    return compute(
        dio.post(
          _authSocial,
          data: {
            'idFollowing': user,
          },
          // options: Options(headers: withAuth()),
        ),
        mapper: AuthResponse.fromJson);
  }

  Future<AuthResponse> register({required data}) async {
    
    return compute(
        dio.post(_register, data: data
            // options: Options(headers: withAuth()),
            ),
        mapper: AuthResponse.fromJson);
  }

  Future<ExistUserResponse> verifyUserExist({required data}) async {
    return compute(
      dio.post(
        _verify_user_exist,
        data: data,
        // options: Options(headers: withAuth()),
      ),
      mapper: ExistUserResponse.fromJson,
    );
  }

  Future<SendUserResponse> sendRecoveryCode({required data}) async {
    log(data.toString());
    return compute(
      dio.post(
        _sendCode,
        data: data,
        // options: Options(headers: withAuth()),
      ),
      mapper: SendUserResponse.fromJson,
    );
  }

  Future<VerifyUserResponse> verifyCode({required data}) async {
    return compute(
      dio.post(
        _verifyCode,
        data: data,
        // options: Options(headers: withAuth()),
      ),
      mapper: VerifyUserResponse.fromJson,
    );
  }

  Future<AuthResponse> newPassword({required data}) async {
    return compute(
      dio.post(
        _newPassword,
        data: data,
        // options: Options(headers: withAuth()),
      ),
      mapper: AuthResponse.fromJson,
    );
  }

  Future<AuthResponse> login({required data}) async {
    return compute(
        dio.post(
          _login,
          data: data,
          // options: Options(headers: withAuth()),
        ),
        mapper: AuthResponse.fromJson);
  }

  Future<AuthResponse> updateUser({
    required data,
  }) {
    return compute(
        dio.patch(
          _updateUser,
          data: data,
          // options: Options(headers: withAuth()),
        ),
        mapper: AuthResponse.fromJson);
  }

  Future<User> updateProfilePicture({required File file}) async {
    return compute(
        dio.patch(_updateProfilePicture,
            // options: Options(headers: withAuth()),
            data: FormData.fromMap({
              'image': await MultipartFile.fromFile(file.path,
                  filename: basename(file.path))
            })),
        mapper: User.fromJson);
  }

  Future<void> logout() {
    return compute(
      dio.post(
        _logout,
        // options: Options(headers: withAuth()),
      ),
    );
  }
}
