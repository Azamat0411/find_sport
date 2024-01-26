part of 'select_lang_bloc.dart';

class SelectLangState {
  Locale? locale;

  SelectLangState({this.locale});

  SelectLangState copyWith({
    Locale? locale,
  }) {
    return SelectLangState(
      locale: locale ?? this.locale,
    );
  }
}

class InitialState extends SelectLangState {}
