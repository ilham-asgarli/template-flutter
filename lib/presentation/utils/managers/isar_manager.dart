import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../utils/constants/di/path_provider_constants.dart';

@LazySingleton()
class IsarManager {
  final Directory applicationDocumentsDirectory;

  const IsarManager({
    @Named(PathProviderConstants.applicationDocumentsDirectory)
    required this.applicationDocumentsDirectory,
  });

  Isar open({
    CollectionSchema<dynamic>? schema,
    List<CollectionSchema<dynamic>>? schemas,
  }) {
    List<CollectionSchema<dynamic>> allSchemas = schemas ?? [];
    if (schema != null) {
      allSchemas.add(schema);
    }

    final isar = Isar.openSync(
      allSchemas,
      directory: applicationDocumentsDirectory.path,
    );

    return isar;
  }
}
