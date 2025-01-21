import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late final SharedPreferences pref;
  static Future<void> init() async =>
      pref = await SharedPreferences.getInstance();

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecureString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static Future<String?> getSecureString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    return await flutterSecureStorage.read(key: key) ?? '';
  }
}
