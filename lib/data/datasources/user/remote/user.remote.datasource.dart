import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/user.model.dart';
import '../../../utils/constants/api/api_url_constants.dart';

part 'user.remote.datasource.g.dart';

@RestApi(baseUrl: ApiUrlConstants.base)
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio) = _UserRemoteDataSource;

  @GET(ApiUrlConstants.user)
  Future<UserModel> getUser(@Path('id') int id);
}
