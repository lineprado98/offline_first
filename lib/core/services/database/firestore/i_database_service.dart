import 'package:offline_first/app/commons/collections/i_collection.dart';
import 'package:offline_first/app/commons/enums/filter_type_enum.dart';
import 'package:offline_first/core/services/database/database_response.dart';

abstract class IDatabaseService {
  Future<DatabaseResponse> create({
    required ICollection collection,
    required String userId,
  });

  Future<DatabaseResponse> update({
    required ICollection collection,
    required String identifier,
    required String userId,
  });

  Future<DatabaseResponse> delete({
    required String collectionName,
    required String identifier,
    required String userId,
  });

  Future<DatabaseResponse> get({
    required String collectionName,
    FilterTypeEnum? orderBy,
    required String userId,
  });
}
