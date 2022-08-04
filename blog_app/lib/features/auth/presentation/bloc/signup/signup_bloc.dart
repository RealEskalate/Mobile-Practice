
import 'package:blog_app/features/auth/presentation/bloc/signup/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/core/index.dart';

import '../../../domain/repository/index.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository authRepository;
  SignupBloc({required this.authRepository}) : super(SignupState()) {
    
    on<SignupNameChanged>(
      (event, emit) {
        emit(state.copyWith(fullName: event.name));
      },
    );
    on<SignupEmailChanged>(
      (event, emit) {
        emit(state.copyWith(fullName: event.email));
      },
    );
    on<SignupPasswordChanged>(
      (event, emit) {
        emit(state.copyWith(fullName: event.password));
      },
    );
    
    on<SignupSubmitted>(
      (event, emit) async {
        emit(state.copyWith(formState: FormSubmitting()));
        try {
          await authRepository.signup(
            fullName: event.fullName,
            email: event.email,
            password: event.password,
          );
          emit(state.copyWith(formState: SubmissionSuccess()));
        } catch (e) {
          // debugPrint(e.toString());
          emit(state.copyWith(formState: SubmissionFailed(Exception(e))));
        }
      },
    );
  }
}
