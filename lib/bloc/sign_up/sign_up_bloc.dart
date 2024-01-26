import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:find_sport/model/register_model.dart';
import 'package:find_sport/repository/rest_client.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final _restClient = RestClient(Dio());

  SignUpBloc() : super(InitialState()) {
    on<InitialEvent>(_onInitialEvent);
    on<ChangeEvent>(_onChangeEvent);
    on<RegisterEvent>(_onRegisterEvent);
  }

  _onInitialEvent(InitialEvent event, Emitter<SignUpState> emit) async {
    emit(InitialState());
  }

  _onChangeEvent(ChangeEvent event, Emitter<SignUpState> emit) async {
    switch (event.step) {
      case 0:
        emit(
          state.copyWith(
            name: event.text,
            isFilled: event.text.isNotEmpty &&
                (state.lastName ?? '').isNotEmpty &&
                (state.phone ?? '').length == 14 &&
                (state.password ?? '').isNotEmpty &&
                (state.password2 ?? '').isNotEmpty &&
                state.password == state.password2,
          ),
        );
        break;
      case 1:
        emit(
          state.copyWith(
            lastName: event.text,
            isFilled: (state.name ?? '').isNotEmpty &&
                event.text.isNotEmpty &&
                (state.phone ?? '').length == 14 &&
                (state.password ?? '').isNotEmpty &&
                (state.password2 ?? '').isNotEmpty &&
                state.password == state.password2,
          ),
        );
        break;
      case 2:
        emit(
          state.copyWith(
            phone: event.text,
            isFilled: (state.name ?? '').isNotEmpty &&
                (state.lastName ?? '').isNotEmpty &&
                event.text.length == 14 &&
                (state.password ?? '').isNotEmpty &&
                (state.password2 ?? '').isNotEmpty &&
                state.password == state.password2,
          ),
        );
        break;
      case 3:
        emit(
          state.copyWith(
            password: event.text,
            isFilled: (state.name ?? '').isNotEmpty &&
                (state.lastName ?? '').isNotEmpty &&
                (state.phone ?? '').length == 14 &&
                event.text.isNotEmpty &&
                (state.password2 ?? '').isNotEmpty &&
                event.text == state.password2,
          ),
        );
        break;
      case 4:
        emit(
          state.copyWith(
            password2: event.text,
            isFilled: (state.name ?? '').isNotEmpty &&
                (state.lastName ?? '').isNotEmpty &&
                (state.phone ?? '').length == 14 &&
                (state.password ?? '').isNotEmpty &&
                event.text.isNotEmpty &&
                state.password == event.text,
          ),
        );
        break;
      case 5:
        emit(
          state.copyWith(
            visible: !(state.visible ?? false),
          ),
        );
        break;
      case 6:
        emit(
          state.copyWith(
            visible2: !(state.visible2 ?? false),
          ),
        );
        break;
    }
  }

  _onRegisterEvent(RegisterEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(loading: event.success));
  }
}
