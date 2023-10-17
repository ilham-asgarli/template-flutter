import 'package:dartz/dartz.dart';

import '../../data/utils/errors/network/api_error.dart';

abstract class UseCase<T, Params> {
  const UseCase();

  Future<Either<ApiError, T>> call(Params params);
}
