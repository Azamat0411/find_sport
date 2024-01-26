import 'package:dio/dio.dart';
import 'package:find_sport/model/create_ads_model.dart';
import 'package:find_sport/model/register_model.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://qutb.uz/api/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('auth/register')
  Future<HttpResponse?> register({
    @Body() required RegisterModel model,
  });

  @POST('ads')
  Future<HttpResponse?> createAds({@Body() required CreateAdsModel model});
}
