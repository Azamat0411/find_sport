part of 'home_screen_bloc.dart';

class HomeScreenEvent {}

class InitialEvent extends HomeScreenEvent {}

class ChangedTextEvent extends HomeScreenEvent {
  final int step;
  final String text;

  ChangedTextEvent({
    required this.step,
    required this.text,
  });
}

class ChangedMapTypeEvent extends HomeScreenEvent {
  final int index;

  ChangedMapTypeEvent({
    required this.index,
  });
}

class ChangedPointEvent extends HomeScreenEvent {
  final Point point;

  ChangedPointEvent({
    required this.point,
  });
}

class CreateNewAdsEvent extends HomeScreenEvent {

  final bool success;

  CreateNewAdsEvent({required this.success});
}
