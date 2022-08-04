
import 'package:blog_app/features/auth/presentation/bloc/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/index.dart';
import '../../../../core/utils/utils.dart';
import 'widgets.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String password = '';

  void _handleFormSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<SignupBloc>().add(SignupSubmitted(
          fullName: fullName, email: email, password: password));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    Validators _validator = Validators();

    return BlocListener<SignupBloc, SignupState>(
      bloc: BlocProvider.of<SignupBloc>(context),
      listener: (BuildContext context, state) {
        // print(state.formState);
        // print("....................<<<<<<<<<<<<<<<<<<<.....................");
        if (state.formState is SubmissionSuccess) {
          // debugPrint('submission successful');

          // context.go("/home");
          Navigator.pushNamed(context, "/homepage");
          // Navigator.pushReplacementNamed(context, "/homepage");
          
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            BlocBuilder<SignupBloc, SignupState>(
              builder: (context, state) {
              return CustomTextField(
                  hintText: 'Full Name',
                  
                  validator: (value) =>
                      _validator.validateName(value)?.toString(),
                  onChanged: (value) {
                    fullName = value;
                    context
                        .read<SignupBloc>()
                        .add(SignupNameChanged(name: value));
                  });
            }),
            SizedBox(
              height: screenHeight * 0.0015,
            ),
            BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
              return CustomTextField(
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                  validator: (value) =>
                      _validator.validateEmail(value)?.toString(),
                  onChanged: (value) {
                    email = value;
                  });
            }),

            SizedBox(
              height: screenHeight * 0.0015,
            ),
            BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
              return PasswordField(
                // labelText: 'Password',
                hintText: 'Password',
                validator: (value) =>
                    _validator.validatePassword(value)?.toString(),
                onChanged: (value) {
                  password = value;
                },
              );
            }),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
              return state.formState is SubmissionFailed
                  ? const Center(
                      child: Text(
                        "Something went wrong, please try again.",
                        style: TextStyle(
                            color: Colors.red, fontFamily: 'Poppins Medium'),
                      ),
                    )
                  : Container();
            }),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
              return state.formState is FormSubmitting
                  ? CircularProgressIndicator()
                  : CallToActionButton(
                      labelText: 'Sign up',
                      onPressed: _handleFormSubmit,
                      backgroundColor: buttons,
                      foregroundColor: Colors.white,
                    );
            }),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'OR SIGN UP WITH ',
                  style: TextStyle(fontFamily: 'Poppins Regular', fontWeight: FontWeight.bold, fontSize: 12),
                ),
               
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            SocialIcons(onPressed: () {  },),
        
            SizedBox(
              height: screenHeight * 0.08,
            ),

            // Padding(padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),),
            BottomQuestion(
              question: 'Already have an account?',
              actionText: 'Log In',
              onPressed: () {
                // context.go("/login");
                Navigator.pushNamed(context, "/login");
                // Navigator.pushReplacementNamed(context, "/login");
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
