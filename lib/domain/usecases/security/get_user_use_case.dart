import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/user_model.dart';
import '../../../data/utils/errors/network/api_error.dart';
import '../../../data/utils/errors/network/custom_error.dart';
import '../../../data/utils/errors/network/not_found_error.dart';
import '../../../utils/di/injectable.dart';
import '../../repositories/security/security_repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class GetUserUseCase extends UseCase<UserModel, GetUserUseCaseParams> {
  final SecurityRepository securityRepository;

  const GetUserUseCase({
    required this.securityRepository,
  });

  @override
  Future<Either<ApiError, UserModel>> call(GetUserUseCaseParams params) async {
    try {
      var v = await getIt<SecurityRepository>().getUser(id: params.id);
      return right(v);
    } on NotFoundError catch (e) {
      return left(NotFoundError(message: e.toString()));
    } on ApiError catch (e) {
      return left(CustomError(message: e.toString()));
    }
  }
}

class GetUserUseCaseParams {
  final String id;

  const GetUserUseCaseParams({
    required this.id,
  });
}
