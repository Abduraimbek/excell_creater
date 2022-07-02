import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const strCurrentTime = "str_current_time";

  static late SharedPreferences prefs;

  static Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString(strCurrentTime, DateTime.now().toString());
  }
}
