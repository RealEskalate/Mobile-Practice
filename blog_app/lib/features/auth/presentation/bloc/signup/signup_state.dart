import 'package:equatable/equatable.dart';

import '../../../../../core/index.dart';

class SignupState extends Equatable {
  final Validators _validators = Validators();
  final String fullName;
  String? get isValidUserName => _validators.validateName(fullName);
  final String email;
  String? get isValidEmail => _validators.validateName(email);
  final String password;
  String? get isValidPassword => _validators.validateName(password);
  final FormSubmissionState formState;
  
  SignupState(
      {this.fullName = '',
      this.email = '',
      this.password = '',
      this.formState = const InitialFormStatus()});

  SignupState copyWith({
    String? fullName,
    String? email,
    String? password,
    FormSubmissionState? formState,
  }) {
    return SignupState(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        password: password ?? this.password,
        formState: formState ?? this.formState);
  }

  @override
  List<Object?> get props =>
      [this.email, this.fullName, this.password, this.formState];
}
