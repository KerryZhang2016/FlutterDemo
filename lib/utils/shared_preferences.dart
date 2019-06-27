import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences Wrap

Future<dynamic> putInt(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt(key, value);
  return "success";
}

Future<int> getInt(String key, [int defaultValue = 0]) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key) ?? defaultValue;
}

Future<dynamic> putBool(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
  return "success";
}

Future<bool> getBool(String key, [bool defaultValue = false]) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(key) ?? defaultValue;
}

Future<dynamic> putDouble(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble(key, value);
  return "success";
}

Future<double> getDouble(String key, [double defaultValue = 0]) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getDouble(key) ?? defaultValue;
}

Future<dynamic> putString(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
  return "success";
}

Future<String> getString(String key, [String defaultValue = ""]) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? defaultValue;
}

Future<dynamic> putStringList(String key, List<String> value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList(key, value);
  return "success";
}

Future<List<String>> getStringList(String key, [List<String> defaultValue]) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key) ?? defaultValue ?? List();
}






