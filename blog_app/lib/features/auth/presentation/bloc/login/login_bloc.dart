import 'dart:convert';
import 'package:blog_app/core/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repository/index.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(LoginState()) {
    on<LoginEmailChanged>(
      (event, emit) {
        emit(state.copyWith(email: event.email));
      },
    );

    on<LoginPasswordChanged>(
      (event, emit) {
        emit(state.copyWith(email: event.password));
      },
    );

    on<LoginSubmitted>(
      (event, emit) async {
        emit(state.copyWith(formState: FormSubmitting()));
        try {
          final response = await authRepository.login(
              email: event.email, password: event.password);
          SecureStorage _secureStorage = SecureStorage();
          final token = jsonDecode(response) as Map<String, dynamic>;
          // print("token");
          // print(token);
          if (!await _secureStorage.hasToken()) {
            // print("checking token");
            await _secureStorage.persistEmailAndToken('event.email', 'token');
            // print("after writing");
          }
          // print("try successful");
          emit(state.copyWith(formState: SubmissionSuccess()));
        } catch (e) {
          // print("try not successful");
          emit(state.copyWith(formState: SubmissionFailed(Exception(e))));
        }
      },
    );
  }
}
