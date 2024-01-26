import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/sign_up/sign_up_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: CustomTextField(
          title: LocaleKeys.textPassword.tr(),
          hint: LocaleKeys.textPasswordHint.tr(),
          obscureText: !(state.visible ?? false),
          onChange: (v) {
            context.read<SignUpBloc>().add(ChangeEvent(step: 3, text: v));
          },
          suffixIcon: InkWell(
            onTap: () {
              context.read<SignUpBloc>().add(ChangeEvent(step: 5, text: ''));
            },
            child: Icon(
              state.visible == true ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
      );
    });
  }
}
