part of 'sign_up_bloc.dart';

class SignUpState {
  String? name;
  String? lastName;
  String? phone;
  String? password;
  String? password2;
  bool? visible;
  bool? visible2;
  bool? isFilled;
  bool? loading;

  SignUpState({
    this.name = '',
    this.lastName = '',
    this.phone = '',
    this.password = '',
    this.password2 = '',
    this.visible = false,
    this.visible2 = false,
    this.isFilled = false,
    this.loading = false,
  });

  SignUpState copyWith({
    String? name,
    String? lastName,
    String? phone,
    String? password,
    String? password2,
    bool? visible,
    bool? visible2,
    bool? isFilled,
    bool? loading,
  }) {
    return SignUpState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      password2: password2 ?? this.password2,
      visible: visible ?? this.visible,
      visible2: visible2 ?? this.visible2,
      isFilled: isFilled ?? this.isFilled,
      loading: loading ?? this.loading,
    );
  }
}

class InitialState extends SignUpState {}
