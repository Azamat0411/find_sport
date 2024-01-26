import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/bloc/custom_bloc_provider.dart';
import 'package:find_sport/bloc/home_screen/home_screen_bloc.dart';
import 'package:find_sport/core/localization/locale_keys.g.dart';
import 'package:find_sport/model/create_ads_model.dart';
import 'package:find_sport/repository/rest_client.dart';
import 'package:find_sport/screens/home_screen/widgets/address_text_field.dart';
import 'package:find_sport/screens/home_screen/widgets/custom_divider.dart';
import 'package:find_sport/screens/home_screen/widgets/description_text_field.dart';
import 'package:find_sport/screens/home_screen/widgets/map_view.dart';
import 'package:find_sport/screens/home_screen/widgets/title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size? size;
  EdgeInsets? padding;

  @override
  void didChangeDependencies() {
    size ??= MediaQuery.sizeOf(context);
    padding ??= MediaQuery.paddingOf(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = (size!.height - padding!.bottom - padding!.top - 56) / 2;
    return CustomBlocProvider<HomeScreenBloc, HomeScreenState>(
        create: (_) => HomeScreenBloc()..add(InitialEvent()),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 2,
              automaticallyImplyLeading: false,
              title: Text(
                LocaleKeys.textNewAds.tr(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF01001F),
                ),
              ),
              actions: [
                state.loading == true
                    ? const SizedBox(
                        width: 56,
                        height: 56,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ))
                    : IconButton(
                        onPressed: state.isFilled == true?() async {
                          if (state.loading == true) {
                            return;
                          }
                          context
                              .read<HomeScreenBloc>()
                              .add(CreateNewAdsEvent(success: true));
                          final restClient = RestClient(Dio());
                          await restClient
                              .createAds(
                            model: CreateAdsModel(
                              title: state.title,
                              description: state.description,
                              lat: state.point!.latitude,
                              lon: state.point!.longitude,
                            ),
                          )
                              .then((value) {
                            if (value?.response.statusCode == 201) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          LocaleKeys.textSuccessNewAds.tr())));
                              context
                                  .read<HomeScreenBloc>()
                                  .add(CreateNewAdsEvent(success: false));
                            } else {
                              context
                                  .read<HomeScreenBloc>()
                                  .add(CreateNewAdsEvent(success: false));
                            }
                          });
                        }:null,
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: state.isFilled == true
                              ? const Color(0xFF327BED)
                              : Colors.black54,
                        ),
                      ),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: height + 20,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Spacer(),
                          TitleTextField(),
                          Spacer(),
                          DescriptionTextField(),
                          Spacer(),
                          CustomDivider(),
                          Spacer(),
                          AddressTextField(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height - 20,
                    child: const MapView(),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
