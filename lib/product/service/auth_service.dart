import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:voice_app/core/navigation/navigation_service.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google sign in
  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //     print('googleUser: $googleUser');
  //     print('credential: $credential');
  //     print('giris basarili ');
  //     // Once signed in, return the UserCredential
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print('Google Sign-In Hatası: $e');
  //     throw e; // Hatanın yeniden fırlatılması, uygun şekilde yönetmenizi sağlar.
  //   }
  // }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // Kullanıcı işlemi iptal etti veya bir hata oluştu
        throw Exception('Google Sign-In işlemi iptal edildi veya hata oluştu.');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      if (googleAuth == null ||
          googleAuth.accessToken == null ||
          googleAuth.idToken == null) {
        // Erişim belirteci veya kimlik belirteci alınamadı
        throw Exception(
            'Google Sign-In işlemi başarısız: Erişim belirteci veya kimlik belirteci alınamadı.');
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      print('googleUser: $googleUser');
      print('credential: $credential');
      print('giriş başarılı ');

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Google Sign-In Hatası: $e');
      throw e;
    }
  }

// Apple sign in
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

  // Email sign in

  // Future<User?> signInWithEmail(
  //     {required String email, required String password}) async {
  //   // _callFirebaseEmulator();

  //   final UserCredential user = await _auth.signInWithEmailAndPassword(
  //       email: email, password: password);

  //   print('user ${user}');

  //   return user.user;
  // }
  Future<User?> signInWithEmail(
      {required String email, required String password}) async {
    final UserCredential userCredential = await _auth
        .signInWithEmailAndPassword(email: email, password: password);
    checkUserLogin();
    // Kullanıcının e-posta adresi doğrulanmış mı kontrol et
    if (userCredential.user?.emailVerified ?? false) {
      print('Kullanıcı girişi başarılı: ${userCredential.user?.email}');
      return userCredential.user;
    } else {
      print('Kullanıcı e-posta adresini onaylamamış.');
      // Eğer e-posta onaylanmamışsa isteğe bağlı olarak kullanıcıya bir e-posta gönderebilir veya hata mesajı verebilirsiniz.
      return null;
    }
  }

  Future<User?> signUpWithEmail(
      {required String email, required String password}) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _auth.currentUser?.sendEmailVerification();

    return result.user;
  }

  Future<User?> checkUserLogin() async {
    User? user = _auth.currentUser;

    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        // Kullanıcı giriş yaptı, ana sayfaya yönlendir.
        print('kullanici giris yapti ${user.email}');
        NavigationService.instance.navigateToPage(path: '/home');
      } else {
        // Kullanıcı giriş yapmadı, giriş ekranına yönlendir.
        print('kullanici giris yapmadi');
        NavigationService.instance.navigateToPage(path: '/');
      }
    });

    return user;
  }
}
