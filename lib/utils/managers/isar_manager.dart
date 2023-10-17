import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../constants/di/path_provider_constants.dart';
import '../di/injectable.dart';

@LazySingleton()
class IsarManager {
  Directory applicationDocumentsDirectory = getIt<Directory>(
      instanceName: PathProviderConstants.applicationDocumentsDirectory);

  Future<Isar> open({
    CollectionSchema<dynamic>? schema,
    List<CollectionSchema<dynamic>>? schemas,
  }) async {
    List<CollectionSchema<dynamic>> allSchemas = schemas ?? [];
    if (schema != null) {
      allSchemas.add(schema);
    }

    final isar = await Isar.open(
      allSchemas,
      directory: applicationDocumentsDirectory.path,
    );

    return isar;
  }
}
