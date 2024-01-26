import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/sign_up/sign_up_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_field.dart';

class LastNameTextField extends StatelessWidget {
  const LastNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: CustomTextField(
        title: LocaleKeys.textLastName.tr(),
        hint: LocaleKeys.textLastNameHint.tr(),
        onChange: (v) {
          context.read<SignUpBloc>().add(ChangeEvent(step: 1, text: v));
        },
      ),
    );
  }
}
