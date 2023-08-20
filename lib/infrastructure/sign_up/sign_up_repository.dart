// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbyx/application/sign_up/sign_up_bloc.dart';
import 'package:orbyx/presentation/widgets/flutter_toast.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({
    required this.context,
  });
  Future<void> handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;
    if (userName.isEmpty) {
      toastInfo(msg: "User name can not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email address can not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password can not be empty");
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: "Confirm Password is wrong");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
          msg:
              "Email has been sent to your registered email. To activate it please check your inbox and click on link",
        );
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "The password is too weak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "The email already used");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Your email id is invalid");
      }
    }
  }
}
