import 'package:voice_app/product/service/auth_service.dart';

class AuthRepository {
  const AuthRepository({required this.service});
  final AuthServices service;
  Future signInWithEmail({required String email, required String password}) {
    return service.signInWithEmail(email: email, password: password);
  }

  Future signUpWithEmail(
      {required String email, required String password}) async {
    return service.signUpWithEmail(email: email, password: password);
  }
}
