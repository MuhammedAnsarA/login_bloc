import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbyx/application/sign_in/sign_in_bloc.dart';
import 'package:orbyx/application/sign_up/sign_up_bloc.dart';
import 'package:orbyx/application/welcome/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBloc(),
        )
      ];
}
