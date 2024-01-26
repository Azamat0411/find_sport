part of 'select_lang_bloc.dart';

class SelectLangEvent {}

class InitialEvent extends SelectLangEvent {}

class ChangeLangEvent extends SelectLangEvent {
  final Locale locale;

  ChangeLangEvent({required this.locale});
}