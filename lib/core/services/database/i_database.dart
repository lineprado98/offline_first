abstract class IDatabase {
  Future<void> write({required CollectionType collectionType, required Map<String, dynamic> json});
  // Future<List<T?>>? read({required T colletion});
  // Future<void> delete({required String id});
}

enum CollectionType { customer, user }
