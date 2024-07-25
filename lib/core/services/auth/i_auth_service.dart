import 'package:offline_first/core/services/auth/auth_response.dart';

abstract class IAuthService {
  Future<AuthResponse> signup({required String password, required String email});

  Future<AuthResponse> signin({required String password, required String email});

  Future<AuthResponse> signout();

  Future<AuthResponse> userIsLogged();
}
