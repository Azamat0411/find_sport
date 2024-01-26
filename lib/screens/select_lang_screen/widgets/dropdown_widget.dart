import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/select_lang/select_lang_bloc.dart';
import 'package:find_sport/core/app_icons.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:find_sport/core/localization/locates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SelectLangBloc, SelectLangState>(
      builder: (context, state) {
        String? language = state.locale?.countryCode;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.textDropdownTitle.tr(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,

              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xFFE7ECF3),
                ),
              ),
              child: DropdownButton(
                isExpanded: true,
                underline: const SizedBox(),
                value: language,
                hint: Row(
                  children: [
                    Image.asset(
                      AppIcons.flag,
                      width: 24,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      LocaleKeys.textDropdownHint.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF949CA9),
                      ),
                    ),
                  ],
                ),
                items: Locates.all
                    .map(
                      (e) => DropdownMenuItem<String>(
                    value: e.countryCode,
                    child: Text(e.countryCode ?? ''),
                  ),
                )
                    .toList(),
                onChanged: (String? value) {
                  if(value == null){
                    return;
                  }
                  for(Locale locale in Locates.all){
                    if(value == locale.countryCode){
                      context.read<SelectLangBloc>().add(ChangeLangEvent(locale: locale));
                      context.setLocale(locale);
                      break;
                    }
                  }
                },
              ),
            ),
          ],
        );
      }
    );
  }
}
