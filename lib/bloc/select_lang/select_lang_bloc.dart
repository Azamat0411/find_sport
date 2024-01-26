import 'dart:ui';

import 'package:bloc/bloc.dart';

part 'select_lang_event.dart';

part 'select_lang_state.dart';

class SelectLangBloc extends Bloc<SelectLangEvent, SelectLangState> {

  SelectLangBloc() : super(InitialState()) {
    on<InitialEvent>(_onInitialEvent);
    on<ChangeLangEvent>(_onChangeLangEvent);
  }

  _onInitialEvent(InitialEvent event, Emitter<SelectLangState> emit) async {
    emit(InitialState());
  }

  _onChangeLangEvent(
      ChangeLangEvent event, Emitter<SelectLangState> emit) async {
    emit(state.copyWith(locale: event.locale));
  }
}
