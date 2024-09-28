import 'dart:developer';
import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthSocialService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  /// Sign in with Google
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      // await signOut();

      final account = await _googleSignIn.signIn();
      log('=========================account.toString()=======================');
      log(account.toString());
      log('=========================account.toString()=======================');

      return account;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  // Sign in with Apple (for iOS)
  // Future<AuthorizationCredentialAppleID?> signInWithApple() async {
  //   try {
  //     if (Platform.isIOS) {
  //       final appleCredential = await SignInWithApple.getAppleIDCredential(
  //         scopes: [
  //           AppleIDAuthorizationScopes.email,
  //           AppleIDAuthorizationScopes.fullName,
  //         ],
  //       );

  //       return appleCredential;
  //     } else {
  //       throw UnsupportedError('Apple Sign-In is only supported on iOS.');
  //     }
  //   } catch (e) {
  //     print("Error signing in with Apple: $e");
  //     return null;
  //   }
  // }

  /// Sign out from all providers
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
