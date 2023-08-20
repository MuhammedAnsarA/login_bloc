import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orbyx/application/sign_up/sign_up_bloc.dart';
import 'package:orbyx/infrastructure/sign_up/sign_up_repository.dart';
import 'package:orbyx/presentation/widgets/common_widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: buildAppBar("Sign Up"),
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 17.h,
                    ),
                    Center(
                      child: reUsebleText(
                          "Enter your details below & free sign up"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 60.h,
                      ),
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reUsebleText("User Name"),
                          buildTextField(
                              "Enter your user name", "Email", "user", (value) {
                            context
                                .read<SignUpBloc>()
                                .add(UserNameEvent(value));
                          }),
                          reUsebleText("Email"),
                          buildTextField(
                              "Enter your email address", "Email", "user",
                              (value) {
                            context.read<SignUpBloc>().add(EmailEvent(value));
                          }),
                          reUsebleText("Password"),
                          buildTextField(
                            "Enter your password",
                            "Password",
                            "lock",
                            (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reUsebleText("Confirm Password"),
                          buildTextField(
                            "Enter your confirm password",
                            "Password",
                            "lock",
                            (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(ConfirmPasswordEvent(value));
                            },
                          ),
                          reUsebleText(
                              "By creating an account you have to agree\nwith our theme & condication"),
                          SizedBox(
                            height: 20.h,
                          ),
                          buildLogInAndRegButton("Sign Up", "login", () {
                            SignUpController(context: context).handleSignUp();
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
