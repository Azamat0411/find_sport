import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/sign_up/sign_up_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:find_sport/model/register_model.dart';
import 'package:find_sport/repository/rest_client.dart';
import 'package:find_sport/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 50),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: (state.isFilled ?? false)
                    ? () async {
                        if (state.loading == true) {
                          return;
                        }
                        context
                            .read<SignUpBloc>()
                            .add(RegisterEvent(success: true));
                        final restClient = RestClient(Dio());
                        await restClient
                            .register(
                          model: RegisterModel(
                              firstName: state.name ?? '',
                              lastName: state.lastName ?? '',
                              phone: state.phone ?? '',
                              password: state.password ?? ''),
                        )
                            .then((value) {
                          if (value?.response.statusCode == 201) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text(LocaleKeys.textSuccessRegister.tr())));
                            GetStorage().write('is_profile', true);
                            context
                                .read<SignUpBloc>()
                                .add(RegisterEvent(success: false));
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          } else {
                            context
                                .read<SignUpBloc>()
                                .add(RegisterEvent(success: false));
                          }
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: const Color(0xFF01001F),
                  fixedSize: const Size(
                    0,
                    40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: (state.loading ?? false)
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        LocaleKeys.textSignUp.tr(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
