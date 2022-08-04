import 'package:flutter/material.dart';
import '../../../../core/utils/utils.dart';
import 'custom_text_form_field.dart';

class TopText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: const Text('Sign up',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    color: dark))),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: const Text(
                'Enter your email and password and start discovering',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: dark,
            )
          )
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.0065,
        ),
        CustomTextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          obscureText: _obscureText,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hoverColor: Colors.white,

              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
                  
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
              hintText: widget.hintText,

              hintStyle: const TextStyle(color: hint),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                ),
              )
              ),
          style: TextStyle(
            fontSize: screenHeight * 0.025,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}



class BottomQuestion extends StatelessWidget {
  const BottomQuestion({
    Key? key,
    required this.question,
    required this.actionText,
    this.onPressed,
  }) : super(key: key);

  final String question;
  final String actionText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: screenHeight * 0.025,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: screenHeight * 0.025,
              color: buttons,
            ),
          ),
        )
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      // required this.labelText,
      required this.hintText,
      this.validator,
      this.onChanged,
      this.inputType = TextInputType.text,
      this.initialValue})
      : super(key: key);

  // final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType inputType;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        CustomTextFormField(
          validator: validator,
          keyboardType: inputType,
          onChanged: onChanged,
          initialValue: initialValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,

            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)),
            
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
            
            hintText: hintText,
            hintStyle: const TextStyle(color: hint),
          ),
          
          style: TextStyle(
            fontSize: screenHeight * 0.025,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}


class CallToActionButton extends StatelessWidget {
  CallToActionButton(
      {Key? key,
      required this.onPressed,
      required this.labelText,
      this.leadingIcon,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.brown,
      this.borderSide = BorderSide.none})
      : super(key: key) {
    if (leadingIcon != null) {
      _child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leadingIcon!,
          const SizedBox(
            width: 10.0,
          ),
          Text(
            labelText,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.0,
              color: foregroundColor,
            ),
          ),
        ],
      );
    } else {
      _child = Text(
        labelText,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 20.0,
          color: foregroundColor,
        ),
      );
    }
  }

  final VoidCallback onPressed;
  final String labelText;
  final Widget? leadingIcon;
  final Color backgroundColor;
  final Color foregroundColor;
  final BorderSide borderSide;

  late final Widget _child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      elevation: 0.0,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      onPressed: onPressed,
      child: _child,
      shape: RoundedRectangleBorder(
        side: borderSide,
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: backgroundColor,
    );
  }
}

class SocialIcons extends StatelessWidget {
  SocialIcons({Key? key, required this.onPressed}) : super(key: key) {}
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    // sign in with text
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RawMaterialButton(
              onPressed: onPressed,
              elevation: 2.0,
              fillColor: Colors.white,
              child: Image.asset('assets/images/iconGoogle.png'),
              padding: EdgeInsets.all(7.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: onPressed,
              elevation: 2.0,
              fillColor: Colors.white,
              child: Image.asset('assets/images/Vector.png'),
              padding: EdgeInsets.all(7.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: onPressed,
              elevation: 2.0,
              fillColor: Colors.white,
              child: Image.asset('assets/images/Twitter.png'),
              padding: EdgeInsets.all(7.0),
              shape: const CircleBorder(),
            ),
          ],
        )
      ],
    );
  }
}


class NoAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        margin: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
        child:const Text(
          "Don't have an account? ",
          style: TextStyle(color: dark, fontSize: 16.0, fontFamily: 'Poppins'),
        ),
      ),
      Container(

        child: TextButton(
          onPressed: () {
            // context.go("/register");
             Navigator.pushNamed(context, "/signup");
          },
          child: const Text(
            'Sign up',
            style: TextStyle(color: dark_blue),
          ),

          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 16,
              fontFamily: 'poppins',
            ),
          ),
        ),
      )
    ]);
  }
}

class ForgotPasswordButton extends StatelessWidget {

  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children:

     [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: RichText(
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.0,
                              color: dark),
                          children: <TextSpan>[
                        TextSpan(
                            text: 'Forgot your password?',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ])))),

          TextButton(
            onPressed: () {},
            child: const Text(
              'Reset here',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  fontSize: 16),
            ),
          )
        ],
      ),
      SizedBox(
        height: screenHeight * 0.03,
      ), 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
        Align(
      alignment: Alignment.center,
      child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child:RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13.0,
                color: dark_blue
              ),
              children: <TextSpan>[
                TextSpan(text: 'OR LOG IN WITH ',
                style: TextStyle(fontWeight: FontWeight.bold)
                ),
              ]
            )
            )
          )
    ),
        ]
      )
    ]
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: const Text('Log in',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                    color: dark))),
        Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: const Text('Welcome',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  color: dark,
                )
                )
                ),
      ],
    );
  }
}
