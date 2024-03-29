import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../utils/constants/di/path_provider_constants.dart';

@LazySingleton()
class IsarManager {
  final Directory applicationDocumentsDirectory;

  const IsarManager({
    @Named(PathProviderConstants.applicationDocuments)
    required this.applicationDocumentsDirectory,
  });

  Isar open({
    IsarGeneratedSchema? schema,
    List<IsarGeneratedSchema>? schemas,
  }) {
    List<IsarGeneratedSchema> allSchemas = schemas ?? [];
    if (schema != null) {
      allSchemas.add(schema);
    }

    final isar = Isar.open(
      schemas: allSchemas,
      directory: applicationDocumentsDirectory.path,
    );

    return isar;
  }
}
