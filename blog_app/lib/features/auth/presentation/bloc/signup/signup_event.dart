import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {}

class SignupNameChanged extends SignupEvent {
  final String name;

  SignupNameChanged({required this.name});

  @override
  List<Object?> get props => [name];
}

class SignupEmailChanged extends SignupEvent {
  final String email;

  SignupEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  SignupPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class SignupSubmitted extends SignupEvent {
  final String fullName;
  final String email;
  final String password;

   SignupSubmitted({required this.fullName, required this.email, required this.password});
  @override
  List<Object?> get props => [];
}
