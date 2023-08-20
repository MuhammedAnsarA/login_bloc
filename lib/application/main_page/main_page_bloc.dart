import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbyx/application/main_page/main_page_event.dart';
import 'package:orbyx/application/main_page/main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(MainPageState()) {
    on<TriggerMainPageEvent>((event, emit) {
      emit(MainPageState(index: event.index));
    });
  }
}
