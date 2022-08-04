
import 'package:blog_app/features/auth/data/auth_data_index.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

   Future<String> login({
    required String email,
    required String password,
  }) async {
    return await authDataProvider.signIn(email: email, password: password);
  }

  Future<void> signup({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await authDataProvider.signUp(
        fullName: fullName, email: email, password: password);
  }

}
