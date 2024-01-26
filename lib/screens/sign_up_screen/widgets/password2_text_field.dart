import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/sign_up/sign_up_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_field.dart';

class Password2TextField extends StatelessWidget {
  const Password2TextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: CustomTextField(
            title: LocaleKeys.textPassword2.tr(),
            hint: LocaleKeys.textPassword2Hint.tr(),
            obscureText: !(state.visible2??false),
            onChange: (v){
              context.read<SignUpBloc>().add(ChangeEvent(step: 4, text: v));
            },
            suffixIcon: InkWell(
              onTap: (){
                context.read<SignUpBloc>().add(ChangeEvent(step: 6, text: ''));
              },
              child: Icon(
                state.visible2 == true?Icons.visibility:Icons.visibility_off,
              ),
            ),
          ),
        );
      }
    );
  }
}
