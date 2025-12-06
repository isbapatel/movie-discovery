import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/utils/shared_prefs_keys.dart';

class LocalStorageService {
  Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefsKeys.isLoggedIn) ?? false;
  }

  Future<void> setIsLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPrefsKeys.isLoggedIn, value);
  }

  Future<List<int>> getFavoriteMovieIds() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(SharedPrefsKeys.favorites);
    if (jsonString == null) return [];
    final List<dynamic> list = jsonDecode(jsonString);
    return list.cast<int>();
  }

  Future<void> toggleFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final current = await getFavoriteMovieIds();
    if (current.contains(movieId)) {
      current.remove(movieId);
    } else {
      current.add(movieId);
    }
    await prefs.setString(SharedPrefsKeys.favorites, jsonEncode(current));
  }

  Future<bool> isFavorite(int movieId) async {
    final current = await getFavoriteMovieIds();
    return current.contains(movieId);
  }
}
