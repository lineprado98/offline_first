import 'dart:developer';
import 'package:isar/isar.dart';
import '../i_database.dart';
import 'collections/customer_collection.dart';
import 'isar_extension.dart';
import 'package:path_provider/path_provider.dart';

class IsarService implements IDatabase {
  late Future<Isar> db;

  IsarService() {
    db = _initDb();
  }

  Future<Isar> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [CustomerColletionSchema],
      directory: dir.path,
    );
  }

  @override
  Future<void> write({required CollectionType collectionType, required Map<String, dynamic> json}) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final (collectionIdentifier, data) = collectionType.toCollection(isar, json);
      await collectionIdentifier.put(data);
    });

    final recipe = await isar.customerColletions.where().findAll();

    inspect(recipe);
  }
}
