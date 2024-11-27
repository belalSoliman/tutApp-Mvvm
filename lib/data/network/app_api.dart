import 'package:dio/dio.dart';
import 'package:tutapp/app/constans.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tutapp/data/response/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constans.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("/customers/login")
  Future<AuthResponse> login(
    @Field('email') String email,
    @Field('password') String password,
  );
}
