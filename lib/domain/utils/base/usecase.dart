import 'package:dartz/dartz.dart';

import '../../../data/utils/exceptions/data.exception.dart';

abstract class UseCase<T, Params> {
  const UseCase();

  Future<Either<DataException, T>> call(Params params);
}
