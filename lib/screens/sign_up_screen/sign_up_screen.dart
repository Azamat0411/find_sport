import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/custom_bloc_provider.dart';
import 'package:find_sport/bloc/sign_up/sign_up_bloc.dart';
import 'package:find_sport/core/app_icons.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/submit_button.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/last_name_text_field.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/name_text_field.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/password2_text_field.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/password_text_field.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/phone_number_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomBlocProvider<SignUpBloc, SignUpState>(
            create: (_) => SignUpBloc()..add(InitialEvent()),
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Image.asset(AppIcons.banner),
                      ),
                      Text(
                          LocaleKeys.textSignUp.tr(),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF01001F)),
                      ),
                      const NameTextField(),
                      const LastNameTextField(),
                      const PhoneNumberTextField(),
                      const PasswordTextField(),
                      const Password2TextField(),
                      const SubmitButton()
                    ],
                  ),
                ),
              );
            },
            listener: (context, state) {}),
      ),
    );
  }
}
