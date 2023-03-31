import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  SharedPreferences? _preferences;
  static SharedPreferencesUtils? sharedPreferencesUtils;


  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferencesUtils getInstance() {
    return sharedPreferencesUtils ??= SharedPreferencesUtils();
  }

  set(String key, dynamic value) async {
    if (value is String) {
      return await _preferences!.setString(key, value);
    } else if (value is double) {
      return await _preferences!.setDouble(key, value);
    } else if (value is int) {
      return await _preferences!.setInt(key, value);
    } else if (value is bool) {
      return await _preferences!.setBool(key, value);
    } else {
      return false;
    }
  }


 getBool(String key){
    return _preferences?.getBool(key);
 }
getString(String key){
    return _preferences?.getString(key);
}

removeString(String key){
    return _preferences?.remove(key);
}

}
