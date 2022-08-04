import 'package:blog_app/core/index.dart';
import 'package:blog_app/features/auth/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../bloc/login/login.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void _handleFormSubmit() {
    if (_formKey.currentState!.validate()) {
      context
          .read<LoginBloc>()
          .add(LoginSubmitted(email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    Validators _validator = Validators();

    return BlocListener<LoginBloc, LoginState>(
        bloc: BlocProvider.of<LoginBloc>(context),
        listener: (BuildContext context, state) {
          // print(state.formState);
          // print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
          if (state.formState is SubmissionSuccess) {
            // context.go("/home");
            Navigator.pushNamed(context, "/homepage");
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return CustomTextField(
                      key: const Key("signInEmailField"),
                      hintText: 'Email',
                      inputType: TextInputType.emailAddress,
                      validator: (value) =>
                          _validator.validateEmail(value)?.toString(),
                      onChanged: (value) => email = value,
                      );
                },
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return PasswordField(
                    hintText: 'Password',
                    key: const Key("signInPasswordField"),
                    validator: (value) =>
                        _validator.validatePassword(value)?.toString(),
                    onChanged: (value) => password = value,
                  );
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),

              BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                // if submmission is failed show error message
                return state.formState is SubmissionFailed
                    ? Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Incorrect Email or Password',
                          style: TextStyle(
                              color: red_dark, fontFamily: 'Poppins Medium'),
                        ),
                      )
                    : Container();
              }),
              BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                return state.formState is FormSubmitting
                    ? const CircularProgressIndicator()
                    : CallToActionButton(
                        labelText: 'Log in',
                        key: const Key("signInSaveButton"),
                        onPressed: _handleFormSubmit,
                        backgroundColor: dark_blue,
                        foregroundColor: Colors.white,
                      );
              }),
              SizedBox(
                height: screenHeight * 0.02,
              ),
             const ForgotPasswordButton(),
              SocialIcons(
                onPressed: () {},
              ),

              SizedBox(
                height: screenHeight * 0.115,
              ),

              // SizedBox(
              //   height: screenHeight * 0.015,
              // ),
              NoAccount(),
            ],
          ),
        ));
  }
}
