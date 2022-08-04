class Validators {
  String? validateName(String? fullName) {
    RegExp regExp =
        RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");
    if (fullName?.length == 0) {
      return 'Please input your fullname!';
    }
    if (!regExp.hasMatch(fullName!)) {
      return "Invalid input";
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email?.length == 0) {
      return 'Please input an email!';
    }

    RegExp regExp =
        RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');

    if (!regExp.hasMatch(email!)) {
      return 'Invalid email!';
    }
  }

  String? validatePassword(String? password) {
    RegExp regExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');

    if (password?.length == 0) {
      return 'Please input password!';
    }

    if (!regExp.hasMatch(password!)) {
      return 'Password must be at least 8 characters and contain a number, a special character, a capital and a small letter.';
    }
  }
}
