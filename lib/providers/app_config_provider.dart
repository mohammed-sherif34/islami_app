import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/api/api_manager.dart';
import 'package:islami_app/home/tabs/radio/model/radio_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  ThemeMode themeMode;
  String savedLanguage;
  String appLanguage = 'ar';
  ThemeMode appTheme = ThemeMode.light;
  final player = AudioPlayer();
  playAudio(String url) async {
    await player.play(UrlSource(url));
    notifyListeners();
  }

  pauseAudio() async {
    //final player = AudioPlayer();
    await player.pause();
    notifyListeners();
  }
  AppConfigProvider(
      {required this.themeMode, required, required this.savedLanguage})
      : appTheme = themeMode,
        appLanguage = savedLanguage;
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    saveLanguage(appLanguage);
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    print('Attempting to change theme to: $newTheme');
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    saveThemeMode(appTheme);
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

  Future<void> saveLanguage(String appLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appLanguage', appLanguage);
    print('Language saved to Shared Preferences: $appLanguage');
  }

  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', themeMode.name);
    print('Theme saved to Shared Preferences: ${themeMode.name}');
  }

  Future<RadioModel?>? radioPlay() async {
    ApiManager apiManager = ApiManager();
    try {
      var response =
          await apiManager.get(endPoint: 'https://mp3quran.net/api/v3/radios');
      return RadioModel.fromJson(response.data);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
