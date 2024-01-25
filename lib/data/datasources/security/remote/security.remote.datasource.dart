import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../models/user.model.dart';
import '../../../utils/constants/api/api_url_constants.dart';

part 'security.remote.datasource.g.dart';

@LazySingleton()
@RestApi(baseUrl: ApiUrlConstants.securityBase)
abstract class SecurityRemoteDataSource {
  @factoryMethod
  factory SecurityRemoteDataSource(Dio dio) = _SecurityRemoteDataSource;

  @GET(ApiUrlConstants.user)
  Future<UserModel> getUser(@Path('id') String id);
}
