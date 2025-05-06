import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/base/base.model.dart';
import '../../../models/token.model.dart';
import '../../../models/user.model.dart';
import '../../../utils/constants/api/api_url_constants.dart';

part 'auth.remote.datasource.g.dart';

@RestApi(baseUrl: ApiUrlConstants.authBase)
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST(ApiUrlConstants.login)
  Future<BaseModel<TokenModel>> login(
      @Path('username') String username, @Path('password') String password);

  @POST(ApiUrlConstants.register)
  Future<BaseModel<TokenModel>> register(
      @Path('username') String username, @Path('password') String password);

  @POST(ApiUrlConstants.refreshToken)
  Future<BaseModel<TokenModel>> refreshToken();
}
