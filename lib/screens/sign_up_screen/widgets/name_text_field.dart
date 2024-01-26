import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/sign_up/sign_up_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: CustomTextField(
          title: LocaleKeys.textName.tr(),
          hint: LocaleKeys.textNameHint.tr(),
          onChange: (v) {
            context.read<SignUpBloc>().add(ChangeEvent(step: 0, text: v));
          },
        ),
        );
  }
}
