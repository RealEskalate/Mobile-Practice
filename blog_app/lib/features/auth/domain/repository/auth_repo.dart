import 'dart:convert';

import 'package:blog_app/features/auth/data/auth_data_index.dart';
import 'package:blog_app/features/user/data/user_data_provider.dart';
import 'package:blog_app/features/user/domain/entities/user.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

  Future<String> login({
    required String email,
    required String password,
  }) async {
    return await authDataProvider.signIn(email: email, password: password);
  }

  void getUser() async {
    // authDataProvider.getUserModel();
    final a = UserProvider();

    var res = await a.getAllUser();
    print(res);
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
