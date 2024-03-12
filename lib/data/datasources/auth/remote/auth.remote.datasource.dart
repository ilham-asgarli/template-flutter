import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../utils/constants/api/api_url_constants.dart';

part 'auth.remote.datasource.g.dart';

@LazySingleton()
@RestApi(baseUrl: ApiUrlConstants.authBase)
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;
}
