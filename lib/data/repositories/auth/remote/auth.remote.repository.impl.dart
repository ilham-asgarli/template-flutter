import 'package:dio/dio.dart';

import '../../../../domain/entities/auth/token.entity.dart';
import '../../../../domain/entities/user/user.entity.dart';
import '../../../../domain/repositories/auth/remote/auth.remote.repository.dart';
import '../../../datasources/auth/remote/auth.remote.datasource.dart';
import '../../../models/auth/token.model.dart';
import '../../../models/base/base.model.dart';
import '../../../models/user/user.model.dart';
import '../../../utils/exceptions/network/custom.exception.dart';
import '../../../utils/exceptions/network/not_found.exception.dart';

class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRemoteRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<UserEntity> login(
      {required String username, required String password}) async {
    try {
      BaseModel<UserModel> model = await authRemoteDataSource.login(
        username,
        password,
      );
      if (model.data != null) {
        return UserEntity.fromModel(model.data!);
      } else {
        throw NotFoundException();
      }
    } on DioException catch (e) {
      throw e.error!;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<TokenEntity> refreshToken() async {
    try {
      BaseModel<TokenModel> model = await authRemoteDataSource.refreshToken();
      if (model.data != null) {
        return TokenEntity.fromModel(model.data!);
      } else {
        throw NotFoundException();
      }
    } on DioException catch (e) {
      throw e.error!;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }

  @override
  Future<UserEntity> register(
      {required String username, required String password}) async {
    try {
      BaseModel<UserModel> model = await authRemoteDataSource.register(
        username,
        password,
      );
      if (model.data != null) {
        return UserEntity.fromModel(model.data!);
      } else {
        throw NotFoundException();
      }
    } on DioException catch (e) {
      throw e.error!;
    } catch (e) {
      throw CustomException(message: e.toString());
    }
  }
}
