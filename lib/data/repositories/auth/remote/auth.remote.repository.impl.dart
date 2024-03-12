import 'package:injectable/injectable.dart';

import '../../../../domain/repositories/auth/remote/auth.remote.repository.dart';
import '../../../datasources/auth/remote/auth.remote.datasource.dart';

@LazySingleton(as: AuthRemoteRepository)
class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRemoteRepositoryImpl({
    required this.authRemoteDataSource,
  });
}
