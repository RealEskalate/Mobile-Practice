import 'package:blog_app/features/auth/presentation/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/repository/index.dart';
import '../bloc/signup/signup_bloc.dart';

class RegisterPage extends StatelessWidget {
  static const String rounteName = "/signup";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: background,
      body: BlocProvider(
        create: (context) => SignupBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: SingleChildScrollView(
          child: SafeArea(

            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopText(),
                  SizedBox(height: screenHeight*0.05,),
                  Container(
                    child: const RegistrationForm(),
                  ),
                ],
              ),
            ),
            ),
        ),
        ),
      );

  }
}
