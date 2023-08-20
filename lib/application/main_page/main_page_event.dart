// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class MainPageEvent {
  const MainPageEvent();
}

class TriggerMainPageEvent extends MainPageEvent {
  final int index;
  TriggerMainPageEvent(this.index) : super();
}
