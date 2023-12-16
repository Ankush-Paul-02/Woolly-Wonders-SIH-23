import 'package:shared_preferences/shared_preferences.dart';

Future<void> setLoggedIn(bool isLoggedIn) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', isLoggedIn);
}

Future<bool> isLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}
