import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orbyx/application/sign_in/sign_in_bloc.dart';
import 'package:orbyx/infrastructure/sign_in/sign_in_repository.dart';
import 'package:orbyx/presentation/widgets/common_widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Log In"),
              body: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                    child: reUsebleText("Or use your email account login"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 60.h,
                    ),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reUsebleText("Email"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                            "Enter your email address", "Email", "user",
                            (value) {
                          context.read<SignInBloc>().add(EmailEvent(value));
                        }),
                        reUsebleText("Password"),
                        SizedBox(
                          height: 5.h,
                        ),
                        buildTextField(
                          "Enter your password",
                          "Password",
                          "lock",
                          (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        forgotPassword(),
                        SizedBox(
                          height: 70.h,
                        ),
                        buildLogInAndRegButton("Log In", "login", () {
                          SignInController(context: context)
                              .handleSignIn("email");
                        }),
                        buildLogInAndRegButton("Sign Up", "signup", () {
                          Navigator.of(context).pushNamed("/sign_up");
                        })
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
        );
      },
    );
  }
}
