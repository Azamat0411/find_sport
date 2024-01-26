import 'package:find_sport/bloc/select_lang/select_lang_bloc.dart';
import 'package:find_sport/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 18),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFF01001F),
            boxShadow: [
              BoxShadow(
                  color: const Color(0xFF01001F).withOpacity(.2),
                  offset: const Offset(-4, 10),
                  blurRadius: 6),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                final locale = context.read<SelectLangBloc>().state.locale;
                if(locale == null){
                  return;
                }
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
