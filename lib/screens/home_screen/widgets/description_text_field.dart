import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/home_screen/home_screen_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.textDescription.tr(),
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          maxLines: 7,
          cursorColor: Colors.blue,
          onChanged: (v){
            context.read<HomeScreenBloc>().add(ChangedTextEvent(step: 1, text: v));
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE7ECF3)),
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE7ECF3)),
              borderRadius: BorderRadius.circular(6),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(6),
            ),
            hintText: LocaleKeys.textDescriptionHint.tr(),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xFF949CA9),
            ),
          ),
        ),
      ],
    );
  }
}
