import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/utils/exceptions/data.exception.dart';
import '../../../data/utils/exceptions/local.exception.dart';
import '../../../data/utils/exceptions/network/socket.exception.dart';
import '../../entities/user/user.entity.dart';
import '../../repositories/user/local/user.local.repository.dart';
import '../../repositories/user/remote/user.remote.repository.dart';
import '../../utils/usecase.dart';

@LazySingleton()
class GetUserUseCase extends UseCase<UserEntity, GetUserUseCaseParams> {
  final UserRemoteRepository userRemoteRepository;
  final UserLocalRepository userLocalRepository;

  const GetUserUseCase({
    required this.userRemoteRepository,
    required this.userLocalRepository,
  });

  @override
  Future<Either<DataException, UserEntity>> call(
    GetUserUseCaseParams params,
  ) async {
    try {
      var response = await userRemoteRepository.getUser(id: params.id);
      return right(response);
    } on SocketException {
      try {
        var response = await userLocalRepository.getUser(id: params.id);
        return right(response);
      } on LocalException catch (e) {
        return left(e);
      }
    } on DataException catch (e) {
      return left(e);
    }
  }
}

class GetUserUseCaseParams {
  final String id;

  const GetUserUseCaseParams({
    required this.id,
  });
}
