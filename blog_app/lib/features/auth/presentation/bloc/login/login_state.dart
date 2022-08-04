import 'package:equatable/equatable.dart';
import 'package:blog_app/core/index.dart';
class LoginState extends Equatable {
  final Validators _validators = Validators();
  final String email;
  String? get isValidEmail => _validators.validateName(email);
  final String password;
  String? get isValidPassword => _validators.validateName(password);
  final FormSubmissionState formState;

  LoginState({
    this.email = '',
    this.password = '',
    this.formState = const InitialFormStatus(),
  });

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionState? formState,
  })
   {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formState: formState ?? this.formState,
    );
  }

  @override
  List<Object?> get props => [this.email, this.password, this.formState];
}
