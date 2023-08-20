import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<UserNameEvent>((event, emit) {
      print("${event.userName}");
      emit(state.copyWith(userName: event.userName));
    });
    on<EmailEvent>((event, emit) {
      print("${event.email}");
      emit(state.copyWith(email: event.email));
    });
    on<PasswordEvent>((event, emit) {
      print("${event.password}");
      emit(state.copyWith(password: event.password));
    });
    on<ConfirmPasswordEvent>((event, emit) {
      print("${event.confirmPassword}");
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
  }
}
