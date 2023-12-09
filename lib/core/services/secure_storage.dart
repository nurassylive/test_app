import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class SecureStorage {
  Future<String?> getData(String key);
  Future<void> putData(String key, String? value);
  Future<void> removeData(String key);
  Future<void> removeAllData();
  Future<void> close();
}

@Singleton(as: SecureStorage)
@preResolve
class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage storage;

  SecureStorageImpl._({required this.storage});

  @factoryMethod
  static Future<SecureStorage> init(FlutterSecureStorage storage) async {
    final instance = SecureStorageImpl._(storage: storage);
    return instance;
  }

  @override
  Future<String?> getData(String key) async {
    try {
      final data = await storage.read(key: key);
      return data;
    } on Exception catch (e, s) {
      Logger().e("Secure storage read exception: $e", error: e, stackTrace: s);
    }
    return null;
  }

  @override
  Future<void> putData(String key, String? value) async {
    try {
      await storage.write(key: key, value: value);
    } on Exception catch (e, s) {
      Logger().e("Secure storage write key exception: $e", error: e, stackTrace: s);
    }
  }

  @override
  Future<void> removeData(String key) async {
    try {
      await storage.delete(key: key);
    } on Exception catch (e, s) {
      Logger().e("Secure storage delete key exception: $e", error: e, stackTrace: s);
    }
  }

  @override
  Future<void> removeAllData() async {
    try {
      await storage.deleteAll();
      Logger().w("Secure storage has been cleared");
    } on Exception catch (e, s) {
      Logger().e("Secure storage delete all exception: $e", error: e, stackTrace: s);
    }
  }

  @override
  Future<void> close() async {}
}
