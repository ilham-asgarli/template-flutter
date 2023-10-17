import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../utils/constants/api/api_url_constants.dart';
import '../../../models/user_model.dart';

part 'security_remote_data_source.g.dart';

@injectable
@RestApi(baseUrl: ApiUrlConstants.securityBase)
abstract class SecurityRemoteDataSource {
  @factoryMethod
  factory SecurityRemoteDataSource(Dio dio) = _SecurityRemoteDataSource;

  @GET(ApiUrlConstants.user)
  Future<UserModel> getUser(@Path('id') String id);
}
