import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../models/user/user.model.dart';
import '../../../utils/constants/api/api_url_constants.dart';

part 'user.remote.datasource.g.dart';

@LazySingleton()
@RestApi(baseUrl: ApiUrlConstants.base)
abstract class UserRemoteDataSource {
  @factoryMethod
  factory UserRemoteDataSource(Dio dio) = _UserRemoteDataSource;

  @GET(ApiUrlConstants.user)
  Future<UserModel> getUser(@Path('id') int id);
}
