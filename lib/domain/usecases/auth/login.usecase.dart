import 'package:dartz/dartz.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../entities/token.entity.dart';
import '../../repositories/auth/remote/auth.remote.repository.dart';
import '../../utils/base/usecase.dart';

class LoginUseCase extends UseCase<TokenEntity, LoginUseCaseParams> {
  final AuthRemoteRepository authRemoteRepository;

  const LoginUseCase({
    required this.authRemoteRepository,
  });

  @override
  Future<Either<DataException, TokenEntity>> call(
    LoginUseCaseParams params,
  ) async {
    try {
      var response = await authRemoteRepository.login(
        username: params.username,
        password: params.password,
      );
      return right(response);
    } on DataException catch (e) {
      return left(e);
    }
  }
}

class LoginUseCaseParams {
  final String username;
  final String password;

  const LoginUseCaseParams({
    required this.username,
    required this.password,
  });
}
