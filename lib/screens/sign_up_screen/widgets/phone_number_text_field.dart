import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/sign_up/sign_up_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:find_sport/screens/sign_up_screen/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberTextField extends StatefulWidget {
  const PhoneNumberTextField({super.key});

  @override
  State<PhoneNumberTextField> createState() => _PhoneNumberTextFieldState();
}

class _PhoneNumberTextFieldState extends State<PhoneNumberTextField> {
  final maskFormatter = MaskTextInputFormatter(
      mask: '(##) ###-##-##',
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: CustomTextField(
        title: LocaleKeys.textPhone.tr(),
        hint: '(__) ___-__-__',
        keyboardType: TextInputType.phone,
        inputFormatter: [maskFormatter],
        onChange: (v) {
          context.read<SignUpBloc>().add(ChangeEvent(step: 2, text: v));
        },
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 12, right: 5),
          child: Text(
            '+998',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
