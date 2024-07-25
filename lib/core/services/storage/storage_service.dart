import 'package:offline_first/core/exceptions/custom_exception.dart';
import 'package:offline_first/core/services/storage/i_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService implements IStorageService {
  const StorageService();

  @override
  Future<void> write({required String key, String? value}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      await storage.setString(key, value ?? '');
    } catch (_) {
      throw StorageUnknown();
    }
  }

  @override
  Future<void> delete({required String key}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      await storage.remove(key);
    } catch (_) {
      throw StorageUnknown();
    }
  }

  @override
  Future<String?> read({required String key}) async {
    try {
      final storage = await SharedPreferences.getInstance();
      if (storage.containsKey(key)) {
        return storage.getString(key);
      }
      return null;
    } catch (_) {
      throw StorageUnknown();
    }
  }
}
