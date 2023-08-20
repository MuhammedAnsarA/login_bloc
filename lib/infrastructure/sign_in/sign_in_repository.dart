import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbyx/application/sign_in/sign_in_bloc.dart';
import 'package:orbyx/core/constant.dart';
import 'package:orbyx/global.dart';
import 'package:orbyx/presentation/widgets/flutter_toast.dart';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need fill email");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need fill password");
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user == null) {
            toastInfo(msg: "You does not exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify email account");
            return;
          }
          var user = credential.user;
          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            print("user displayName ${displayName}");
            print("user email ${email}");
            print("user open_id ${id}");
            print("user photoUrl ${photoUrl}");
            print("user exist");
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/main_page", (route) => false);
            //we got verifed user from firebase
          } else {
            toastInfo(msg: "Currently you are not user");
            return;
            //we have error getting a firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "No user found that email");
            return;
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "Wrong password provide for that user");
            return;
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "your email format is wrong");
            return;
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
