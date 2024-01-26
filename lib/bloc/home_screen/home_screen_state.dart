part of 'home_screen_bloc.dart';

class HomeScreenState {
  String? title;
  String? description;
  String? address;
  Point? point;
  bool? isMap;
  bool? loading;
  bool? isFilled;

  HomeScreenState({
    this.title = '',
    this.description = '',
    this.address = '',
    this.point,
    this.isMap = true,
    this.loading = false,
    this.isFilled = false,
  });

  HomeScreenState copyWith({
    String? title,
    String? description,
    String? address,
    Point? point,
    bool? isMap,
    bool? loading,
    bool? isFilled,
  }) {
    return HomeScreenState(
      title: title ?? this.title,
      description: description ?? this.description,
      address: address ?? this.address,
      point: point ?? this.point,
      isMap: isMap ?? this.isMap,
      loading: loading ?? this.loading,
      isFilled: isFilled ?? this.isFilled,
    );
  }
}

class InitialState extends HomeScreenState {}
