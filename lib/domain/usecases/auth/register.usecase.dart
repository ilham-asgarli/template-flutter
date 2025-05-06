import 'package:dartz/dartz.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../entities/token.entity.dart';
import '../../repositories/auth/remote/auth.remote.repository.dart';
import '../../utils/base/usecase.dart';

class RegisterUseCase extends UseCase<TokenEntity, RegisterUseCaseParams> {
  final AuthRemoteRepository authRemoteRepository;

  const RegisterUseCase({
    required this.authRemoteRepository,
  });

  @override
  Future<Either<DataException, TokenEntity>> call(
    RegisterUseCaseParams params,
  ) async {
    try {
      var response = await authRemoteRepository.register(
        username: params.username,
        password: params.password,
      );
      return right(response);
    } on DataException catch (e) {
      return left(e);
    }
  }
}

class RegisterUseCaseParams {
  final String username;
  final String password;

  const RegisterUseCaseParams({
    required this.username,
    required this.password,
  });
}
