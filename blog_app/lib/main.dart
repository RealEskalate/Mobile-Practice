import 'package:blog_app/core/index.dart';
import 'package:blog_app/features/auth/data/auth_data_index.dart';
import 'package:blog_app/features/auth/presentation/pages/index.dart';
import 'package:blog_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'features/auth/domain/repository/index.dart';
import 'features/auth/presentation/bloc/signup/signup.dart';
import 'features/auth/presentation/bloc/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepo = new AuthRepository(
      authDataProvider: AuthDataProvider(httpClient: http.Client()));
  final SecureStorage secureStorage = new SecureStorage();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => authRepo,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SignupBloc(
              authRepository: authRepo,
            ),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
              authRepository: authRepo,
            ),
          ),
        ],
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Blog demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: LoginPage.rounteName,
            onGenerateRoute: PageRouter.generateRoute,
          );
        }),
      ),
    );
  }
}
