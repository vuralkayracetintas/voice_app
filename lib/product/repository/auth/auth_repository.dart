class AuthRepository {
  Future signInWithEmail() async {
    await Future.delayed(const Duration(seconds: 2));

    throw Exception('Login Repo Error');
  }
}
