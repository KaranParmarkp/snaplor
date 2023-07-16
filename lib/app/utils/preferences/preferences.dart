
import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  late final SharedPreferences _prefs;

  load() async {
    _prefs = await SharedPreferences.getInstance();
  }

  setString(String key, String value) {
    _prefs.setString(key, value);
  }

  setBool(String key,bool value){
    _prefs.setBool(key, value);
  }

  setInt(String key, int value) {
    _prefs.setInt(key, value);
  }

  removeString(String key) {
    _prefs.remove(key);
  }

  clearPref() {
    _prefs.clear();
  }

  Future<String?> getData(String key) async {
    return _prefs.getString(key);
  }

  Future<bool?> getBoolData(String key) async {
    return _prefs.getBool(key);
  }

  Future<int?> getInt(int key) async{
    return _prefs.getInt(key.toString());
  }

}

class PreferenceKeys {
  static const String appPrefName = "QuinableFacility";
  static const String isBiometric = "isBiometric";
}