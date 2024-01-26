import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xFF01001F),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            LocaleKeys.textChangeLocation.tr(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xFF01001F),
          ),
        ),
      ],
    );
  }
}
