import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import '../i_database.dart';
import 'collections/customer_collection.dart';

extension CollectionTypeExtension on CollectionType {
  (IsarCollection, dynamic) toCollection(Isar isar, Map<String, dynamic> json) {
    switch (this) {
      case CollectionType.customer:
        return (isar.customerColletions, CustomerColletion.fromJson(json));
      default:
        throw FlutterError('Collection Not found');
    }
  }
}
