import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterModel {
  const RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
  });

  final String firstName;
  final String lastName;
  final String phone;
  final String password;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'firstname': firstName,
        'lastname': lastName,
        'phone': phone,
        'password': password,
      };
}
