import 'package:find_sport/bloc/custom_bloc_provider.dart';
import 'package:find_sport/bloc/select_lang/select_lang_bloc.dart';
import 'package:find_sport/core/app_icons.dart';
import 'package:find_sport/screens/select_lang_screen/widgets/dropdown_widget.dart';
import 'package:find_sport/screens/select_lang_screen/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class SelectLangScreen extends StatefulWidget {
  const SelectLangScreen({super.key});

  @override
  State<SelectLangScreen> createState() => _SelectLangScreenState();
}

class _SelectLangScreenState extends State<SelectLangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBlocProvider<SelectLangBloc, SelectLangState>(
        create: (_) => SelectLangBloc()..add(InitialEvent()),
        listener: (context, state) async {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 3,
                ),
                Image.asset(
                  AppIcons.logo,
                ),
                const Spacer(
                  flex: 2,
                ),
                const DropdownWidget(),
                const SubmitButton(),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
