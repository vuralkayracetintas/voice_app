import 'package:voice_app/product/repository/auth/auth_repository.dart';
import 'package:voice_app/product/service/auth_service.dart';

class RepositoryStore {
  static final AuthRepository authRepository =
      AuthRepository(service: AuthServices());
}
