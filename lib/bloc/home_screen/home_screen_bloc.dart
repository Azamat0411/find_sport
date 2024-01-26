import 'package:bloc/bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'home_screen_event.dart';

part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(InitialState()) {
    on<InitialEvent>(_onInitialEvent);
    on<ChangedMapTypeEvent>(_onChangedMapTypeEvent);
    on<ChangedTextEvent>(_onChangedTextEvent);
    on<ChangedPointEvent>(_onChangedPointEvent);
    on<CreateNewAdsEvent>(_onNewAdsEvent);
  }

  _onInitialEvent(InitialEvent event, Emitter<HomeScreenState> emit) async {
    emit(InitialState());
  }

  _onChangedTextEvent(
      ChangedTextEvent event, Emitter<HomeScreenState> emit) async {
    switch (event.step) {
      case 0:
        emit(
          state.copyWith(
            title: event.text,
            isFilled: event.text.isNotEmpty &&
                (state.description ?? '').isNotEmpty &&
                state.point != null,
          ),
        );
        break;
      case 1:
        emit(
          state.copyWith(
            description: event.text,
            isFilled: (state.title ?? '').isNotEmpty &&
                event.text.isNotEmpty &&
                state.point != null,
          ),
        );
        break;
      case 2:
        emit(state.copyWith(address: event.text));
        break;
    }
  }

  _onChangedMapTypeEvent(
      ChangedMapTypeEvent event, Emitter<HomeScreenState> emit) async {
    if (event.index == 0) {
      emit(state.copyWith(isMap: true));
    } else {
      emit(state.copyWith(isMap: false));
    }
  }

  _onChangedPointEvent(
      ChangedPointEvent event, Emitter<HomeScreenState> emit) async {
    emit(
      state.copyWith(
        point: event.point,
        isFilled: (state.title ?? '').isNotEmpty &&
            (state.description ?? '').isNotEmpty,
      ),
    );
    final a = await YandexSearch.searchByPoint(
        point: event.point,
        searchOptions: const SearchOptions(
          searchType: SearchType.geo,
        )).result;
    if ((a.items ?? []).isNotEmpty) {
      emit(state.copyWith(
          address: a.items?.first.toponymMetadata?.address.formattedAddress));
    }
  }

  _onNewAdsEvent(CreateNewAdsEvent event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(loading: event.success));
  }
}
